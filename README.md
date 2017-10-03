[日本語ReadMe](https://github.com/adrs2002/threeInstancedBreakObject/blob/master/README-JP.md)

# THREE.InstancedBreakObject
Instanced and break shading object for three.js.


![tumb]('https://raw.githubusercontent.com/adrs2002/threeInstancedBreakObject/master/content/tumb.png' "tumb")

====

# Overview
addon class for Three.js.
Instantiate a 3D object (mesh, geometry) and make a "crumbling" expression on the shader。 

## Demo

* [demo](http://adrs2002.com/sandbox/breakshader/index.html)
* [demo2](http://adrs2002.com/sandbox/breakshader/instansingtest.html)

## Requirement
* [THREE.js](https://github.com/mrdoob/three.js/)

--------

## how to use

### 0. add files your Project. 'three.js(three.min.js)'and 'threeBreakShader.js'

### 1. Prepare the object you want to break and apply breakShader.
   THREE.mesh　or　geometry 。

```
// mesh = any object

breakObject = new THREE.InstancedBreakObject(mesh);
scene.add(breakObject);
```   

### 2. begin break.

```
breakObject.beginBreak(); 
```

### Constructor Option 

 PropertyName | type  | defaultValue |  description    
  --- | --- | --- |  ---  
| **makeCount** | `int` | *1* | Specify the number of generated items. |  
| **positions** | `Vector3[]` | *[]* | Specify placement locations. if it is not the same number as makeCount, X and Z axis are Randoms, Y is fixed "0". |  
| **autoHidden** | `bool` | *true* | It specifies whether to keep it automatically deleted, after animation. true: keep hidden. false: return before break. |  
| **gravity** | `float` |  *1.0* | set gravity(auto add Y axis) |  
| **scaleFactor** | `float` |  *1.0* | scaling. The same value is set for  XYZ |  
| **randomScale** | `bool` |  *false* | if true, Change the size randomly from 0.1 to scaleFactor. |  

```

positions = [];
for(var i =0; i < 100; i++){
 positions.push( new THREE.Vector3().set(Math.random() * 100 -50, 0, Math.random() * 100 - 50) );
}

breakObject = new THREE.InstancedBreakObject(mesh, { makeCount : 100, positions : positions  });

```
------------- 

### Methods

#### beginBreak

begin Break animation

 PropertyName| type | defaultValue |  description  
  --- | --- | --- |  ---  
| **id** | `int` | *0* | Specify the array ID of the object to be crushed. |  
| **force** | `bool` | *false* | Whether to force animation to occur or not. If true, play crush animation from scratch. If it is false, if animation has already been finished or hidden, crush animation will not be performed. |  

```
breakObject.beginBreak({id:0});
```

#### checkHits

Confirm collisions with Ray.The IDs of all arrays that detected the collision and collision points are returned.

 PropertyName| type | description  
  --- | --- | --- |  ---  
| **id** | `int` | detected array id |  
| **o** | `Vector3` | collision points |  

```
const pos = new THREE.Vector3(mouseX, mouseY, 1);
      pos.unproject(camera);

const ray = new THREE.Raycaster(camera.position, pos.sub(camera.position).normalize());

const refs = breakObject.checkHits(ray);
 for (let i = 0; i < refs.length; i++) {
    breakObject.beginBreak({refs[i].id});
 }
```

#### checkHit

Confirm collision with Ray.The ID of the nearest array and the collision point are returned when collision is detected.

 PropertyName| type | description  
  --- | --- | --- |  ---  
| **id** | `int` | detected array id |  
| **o** | `Vector3` | collision points |  

```
const pos = new THREE.Vector3(mouseX, mouseY, 1);
      pos.unproject(camera);

const ray = new THREE.Raycaster(camera.position, pos.sub(camera.position).normalize());

const ref = breakObject.checkHits(ray);
if(!ref){
    breakObject.beginBreak({ref.id});
    console.log(ref.o);
}
```


---------------------------------


## LICENCE
 MIT.