<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>three.js webgl - OBJLoader + MTLLoader</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <style>
        #info {
            color: #fff;
            position: absolute;
            top: 10px;
            width: 50%;
            text-align: center;
            z-index: 100;
            display:block;
        }
        #info a, .button { color: #f00; font-weight: bold; text-decoration: underline; cursor: pointer }
    </style>
</head>

<body>
<div id="info">
    <a href="http://threejs.org" target="_blank">three.js</a> - OBJLoader + MTLLoader
</div>
<div id="testDiv">

</div>

<script src="/script/three/three.min.js"></script>

<script src="/script/three/loaders/DDSLoader.js"></script>
<script src="/script/three/loaders/MTLLoader.js"></script>
<script src="/script/three/loaders/OBJLoader.js"></script>

<script src="/script/three/Detector.js"></script>
<script src="/script/three/stats.min.js"></script>

<script>

    var container, stats;

    var camera, scene, renderer;

    var mouseX = 0, mouseY = 0;

    var windowHalfX = window.innerWidth / 2;
    var windowHalfY = window.innerHeight / 2;


    init();
    animate();


    function init() {

        container = document.createElement( 'div' );
        document.body.appendChild( container );

        camera = new THREE.PerspectiveCamera( 1000, window.innerWidth / window.innerHeight, 1, 10000 );
        camera.position.z = -30;
        camera.position.x = 3000;
        camera.position.y = -10000;

        // scene

        scene = new THREE.Scene();

        var ambient = new THREE.AmbientLight( 0xffffff );
        scene.add( ambient );

        var directionalLight = new THREE.DirectionalLight( 0xffffff );
        directionalLight.position.set( 0, 0, 1 ).normalize();
        scene.add( directionalLight );

        // model

        var onProgress = function ( xhr ) {
            if ( xhr.lengthComputable ) {
                var percentComplete = xhr.loaded / xhr.total * 100;
                console.log( Math.round(percentComplete, 2) + '% downloaded' );
            }
        };

        var onError = function ( xhr ) { };

        THREE.Loader.Handlers.add( /\.dds$/i, new THREE.DDSLoader() );

        var mtlLoader = new THREE.MTLLoader();
        mtlLoader.setPath( 'obj/03/' );
        mtlLoader.load( '03.mtl', function( materials ) {

            materials.preload();

            var objLoader = new THREE.OBJLoader();
            objLoader.setMaterials( materials );
            objLoader.setPath( 'obj/03/' );
            objLoader.load( '03.obj', function ( object ) {

                object.position.y = - 1;
                scene.add( object );

            }, onProgress, onError );

        });

        //

        renderer = new THREE.WebGLRenderer();
        renderer.setPixelRatio( window.devicePixelRatio );
        renderer.setSize( window.innerWidth, window.innerHeight );
        container.appendChild( renderer.domElement );

        document.addEventListener( 'mousemove', onDocumentMouseMove, false );

        //

        window.addEventListener( 'resize', onWindowResize, false );

    }

    function onWindowResize() {

        windowHalfX = window.innerWidth / 2;
        windowHalfY = window.innerHeight / 2;

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();

        renderer.setSize( window.innerWidth, window.innerHeight );

    }

    function onDocumentMouseMove( event ) {

        mouseX = ( event.clientX - windowHalfX ) / 2;
        mouseY = ( event.clientY - windowHalfY ) / 2;

    }

    //

    function animate() {

        requestAnimationFrame( animate );
        render();

    }

    function render() {

        camera.position.x += ( mouseX - camera.position.x ) * .05;
        camera.position.y += ( - mouseY - camera.position.y ) * .05;

        camera.lookAt( {
            x:3000,
            y:3000,
            z:3000
        });

        renderer.render( scene, camera );

    }

</script>

</body>
</html>

