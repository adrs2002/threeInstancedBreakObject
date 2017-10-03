"use strict";

// import THREE from 'three'

/**
 * @author Jey-en  https://github.com/adrs2002
 * 
 * this repo -> https://github.com/adrs2002/threeInstancedBreakObject
 *
 */

/**
 * THREE.InstancedBreakObject
 * @constructor
 * @extends THREE.Object3D
 */
class threeInstancedBreakObject extends THREE.Object3D {
  constructor(_base, _option = {}) {
    super();

    const {
      scaleFactor = 1.0,
        gravity = 1.0,
        makeCount = 1, //これがパーティクルの作成最大数。多すぎると死ぬ
        positions = [],
        randomScale = false,
        autoHidden = true
    } = _option;


    this.particleCount = makeCount;
    this.clock = new THREE.Clock();
    const baseGeometry = _base.type == 'Mesh' ? _base.geometry : _base;

    this.geo = new THREE.InstancedBufferGeometry();
    this.centerToFaces = [];
    this.nowTimes = [];
    this.translates = positions;
    this.autoHidden = autoHidden;

    // 全頂点の中心がほしいので、BoudingSphereを算出
    if (!baseGeometry.boundingSphere) {
      baseGeometry.computeBoundingSphere();
    }
    if (!baseGeometry.boundingBox) {
      baseGeometry.computeBoundingBox();
    }

    this.baseBoundingBox = baseGeometry.boundingBox.clone();

    if (baseGeometry.type == 'BufferGeometry') {
      this.geo.copy(baseGeometry);

      // 中心からのベクトルを作成
      for (var i = 0; i < baseGeometry.attributes.position.array.length; i += 9) {

        const tmptV = new THREE.Vector3();
        tmptV.x = baseGeometry.attributes.position.array[i + 0] + baseGeometry.attributes.position.array[i + 3] + baseGeometry.attributes.position.array[i + 6];
        tmptV.y = baseGeometry.attributes.position.array[i + 1] + baseGeometry.attributes.position.array[i + 4] + baseGeometry.attributes.position.array[i + 7];
        tmptV.z = baseGeometry.attributes.position.array[i + 2] + baseGeometry.attributes.position.array[i + 5] + baseGeometry.attributes.position.array[i + 8];

        tmptV.divideScalar(3);
        tmptV.sub(baseGeometry.boundingSphere.center);
        tmptV.normalize();
        const centerV = new THREE.Vector3().copy(tmptV);
        // attributeは、面毎ではなく頂点毎に渡すので、3つ同じ値を作成する
        this.centerToFaces.push(centerV);
        this.centerToFaces.push(centerV);
        this.centerToFaces.push(centerV);
      }

    } else {
      const useGeo = new THREE.Geometry();
      for (var i = 0; i < baseGeometry.faces.length; i++) {
        // 面に割り当てられている頂点を複製。全く同じ位置の頂点も複製されるけど、必要になるので気にしない
        useGeo.vertices.push(new THREE.Vector3().copy(baseGeometry.vertices[baseGeometry.faces[i].a]));
        useGeo.vertices.push(new THREE.Vector3().copy(baseGeometry.vertices[baseGeometry.faces[i].b]));
        useGeo.vertices.push(new THREE.Vector3().copy(baseGeometry.vertices[baseGeometry.faces[i].c]));
        //面を作成
        useGeo.faces.push(new THREE.Face3(i * 3, i * 3 + 1, i * 3 + 2));

        // 中心からのベクトルを作成
        const tmptV = new THREE.Vector3().copy(baseGeometry.vertices[baseGeometry.faces[i].a]);
        tmptV.add(baseGeometry.vertices[baseGeometry.faces[i].b]);
        tmptV.add(baseGeometry.vertices[baseGeometry.faces[i].c]);
        tmptV.divideScalar(3).normalize();
        const centerV = new THREE.Vector3().copy(tmptV);
        this.centerToFaces.push(centerV);
      }
      this.geo.copy(useGeo);
    }

    // this.translateArray = new Float32Array(this.particleCount * 3);
    this.translateArray = new THREE.InstancedBufferAttribute(new Float32Array(this.particleCount * 3), 3, 1);
    if (this.particleCount > 1) {
      for (var i = 0, ul = this.translateArray.count; i < ul; i++) {
        if (positions && positions.length > i) {
          this.translateArray.setXYZ(i, positions[i].x, positions[i].y, positions[i].z);
        } else {
          var x = Math.random() - 0.5;
          var y = 0;
          var z = Math.random() * 0.5;
          this.translateArray.setXYZ(i, x * 100, 0, z * 100);
          this.translates.push(new THREE.Vector3( x * 100, 0, z * 100));
        }
      }
    } else {
      this.translateArray.setXYZ(0, 0, 0, 0);
      this.translates.push(new THREE.Vector3(0,0,0));
    }
    this.geo.addAttribute('translation', this.translateArray);

    this.timeArray = new THREE.InstancedBufferAttribute(new Float32Array(this.particleCount * 1), 1, 1);
    for (var i = 0, ul = this.timeArray.count; i < ul; i++) {
      this.timeArray.setX(i, 0);
      this.nowTimes.push(0);
    }
    this.geo.addAttribute('time', this.timeArray);

    this.scaleArray = new THREE.InstancedBufferAttribute(new Float32Array(this.particleCount * 3), 3, 1);
    if (this.particleCount > 1) {
      for (var i = 0, ul = this.scaleArray.count; i < ul; i++) {
        if (randomScale) {
          var x = Math.random() * scaleFactor + 0.1;
          var y = Math.random() * scaleFactor + 0.1;
          var z = Math.random() * scaleFactor + 0.1;
          this.scaleArray.setXYZ(i, x, y, z);
        } else {
          this.scaleArray.setXYZ(i, scaleFactor, scaleFactor, scaleFactor);
        }
      }
    } else {
      this.scaleArray.setXYZ(0, scaleFactor, scaleFactor, scaleFactor);
    }
    this.geo.addAttribute('scale', this.scaleArray);

    this.centerNormalArray = new THREE.BufferAttribute(new Float32Array(this.centerToFaces.length * 3), 3, 1);
    for (var i = 0; i < this.centerToFaces.length; i++) {
      this.centerNormalArray.setXYZ(i, this.centerToFaces[i].x, this.centerToFaces[i].y, this.centerToFaces[i].z);
    }
    this.geo.addAttribute('centerNormal', this.centerNormalArray);
    this.geo.attributes.centerNormal.needsUpdate = true;

    var texture = _base.material[0].map;
    var material = new THREE.ShaderMaterial({
      vertexShader: this.getVshader(),
      fragmentShader: this.getFshader(),
      uniforms: {
        map: {
          type: 't',
          value: texture
        },
        gravity: {
          type: 'f',
          value: gravity
        }
      },
      side: THREE.DoubleSide
    });

    const mesh = new THREE.Mesh(this.geo, material);

    mesh.frustumCulled = false;
    mesh.scale.set(1, 1, 1);
    this.add(mesh);

    this.updateMatrixWorld = this.updater;

    return this;

  }

  getVshader() {
    return `
      uniform float gravity;

      attribute vec3 translation;
      attribute float time;
      attribute vec3 scale;
      attribute vec3 centerNormal;

      varying vec2 vUv;
      
      void main() {
          vUv = uv;
          vec3 addingpos = centerNormal * time * scale * 10.0;
          float time_f =  time * 10.0;
          addingpos.y = addingpos.y - time_f * time_f * gravity * 0.1;
          gl_Position = projectionMatrix * modelViewMatrix * vec4(translation + addingpos + position * scale , 1.0);
      }
      `;
  }

  /**
   * WIP : very very simply shading yet.
   */
  getFshader() {
    return `
      precision mediump float;
      uniform sampler2D map;
      
      varying vec2 vUv;
      
      void main() {
          gl_FragColor = texture2D(map, vUv);
      }
      `;
  }

  updater() {
    const delta = this.clock.getDelta();

    for (let i = 0; i < this.particleCount; i++) {
      if (this.nowTimes[i] > 0) {
        this.nowTimes[i] += delta;
        if (this.nowTimes[i] > 1.0) {
          if(this.autoHidden){
            this.scaleArray.setXYZ(i,0.0, 0.0, 0.0);
            this.nowTimes[i] = -1.0;
          }else{
            this.nowTimes[i] = 0.0;
          }
        }
        this.timeArray.setX(i, this.nowTimes[i]);
      }
    }

    this.geo.attributes.time.needsUpdate = true;
    this.geo.attributes.scale.needsUpdate = true;

    // if you need translation , without comment outs.
    // this.geo.attributes.translation.needsUpdate = true;

    super.updateMatrixWorld.call(this);
  }

  /**
   * begining breaking
   */
  beginBreak(_option = {}) {
    const {
      id = 0,
        force = false
    } = _option;

    if (force || this.nowTimes[id] == 0) {
      this.nowTimes[id] = 0.001;
    }
  }

  /**
   * check hit collisions from ray
   */
  checkHits(_ray) {
    const hits = [];
    for (let i = 0; i < this.particleCount; i++) {
      if(this.nowTimes[i] == 0){continue;}
      const box = this.baseBoundingBox.clone();
      box.translate(this.translates[i]);
      const r = _ray.ray.intersectBox(box);
      if(r){
        hits.push({id :i , o : r});
      }
    }

    return hits;
  }

  /**
   * check nearest hit collision from ray
   */
  checkHitOne(_ray) {
    const hits = this.checkHits(_ray);
    if (!hits || hits.length == 0) {
      return null;
    } else {
      let refI = 0;
      let nearestLength = Number.MAX_VALUE;
      const TmpV3 = new THREE.Vector3();
      for(let i =0; i < hits.length;i++){
        TmpV3.copy(_ray.ray.origin);
        TmpV3.sub(hits[i].o);
        const leng = TmpV3.length();
        if(nearestLength > leng){
          nearestLength = leng;
          refI = i;
        }
      }
      return hits[refI];
    }
  }
}

var THREE = THREE || {};

THREE.InstancedBreakObject = threeInstancedBreakObject;
threeInstancedBreakObject = null;