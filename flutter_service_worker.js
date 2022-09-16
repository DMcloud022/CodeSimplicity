'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "bbb78d51e579f448604550abfcee4153",
"assets/FontManifest.json": "3d3bbd93c030401194cf4ceedbeee9e8",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/Poppins-Regular.ttf": "e212f84086965da44a6c84f3d9a683a4",
"assets/images/banner.jpg": "a7bf43da1db3df7e9f0b72c3ed1364a5",
"assets/images/homeBackground.png": "460d67e0c8ac12f15fac8531d839e150",
"assets/images/home_icon/CPlusPlus.png": "cdbfc9d6fe1587e3dc81c43ba14ec52d",
"assets/images/home_icon/dart.png": "fe1f0cdf229ab6866aa9ddfb187df036",
"assets/images/home_icon/javaImage.png": "dadcc124be319041f6fd0527370972e2",
"assets/images/home_icon/javascript.png": "2731bf4a35d621cfaf006368f0a1e66d",
"assets/images/home_icon/pythonImage.png": "c62a8e1d78d702900ef8fa9e507fc0b2",
"assets/images/home_icon/ruby.png": "0d768c05b1203ca8b2ebf7b55c34df68",
"assets/images/Logo.png": "c3dabe482f4ef9173433e7126593dec6",
"assets/images/ProgrammingB.jpg": "3bcdac4cd99728f2f0f1df758beb2a76",
"assets/images/Samples/BasicHTML.jpg": "50ab96609114dbdb53ae713a01ade8a1",
"assets/images/Samples/class_dart.jpg": "df5b075025b91cc874e149cfba1fecc9",
"assets/images/Samples/console.jpg": "e52ae94185b7acfa6fbb290d18f993b0",
"assets/images/Samples/dart_print.png": "4718b8802f3cbe8431bff8cdff8cb8da",
"assets/images/Samples/DataTypes_Dart.jpg": "b2f2456244e758da1e5f8f7532f28988",
"assets/images/Samples/DataTypes_Java.jpg": "1214929158db08173aeb1ef2579b6af4",
"assets/images/Samples/data_types_1.png": "200d61018ac486ed9bd0d28341f19f73",
"assets/images/Samples/data_types_2.png": "d6c392fb7bcaff60f560c0a7368430f7",
"assets/images/Samples/java_class.jpg": "11bc396696d491827efe993b0779ecd8",
"assets/images/Samples/objectJS.jpg": "c27aa33008944276566623fdd0de78b8",
"assets/images/Samples/seperate1.jpg": "108ed7e7d026e3ce6a1e444c08156feb",
"assets/images/Samples/seperate2.jpg": "0c370463f8300af9b91a4a0528244b85",
"assets/images/Samples/variable.jpg": "ee11c6c6a70f014038b9bcc7d109f76a",
"assets/images/Welcome.jpg": "af370211db3dd910f5a653dbb1fb8f3d",
"assets/images/Welcome2.jpg": "bdfa365719bf52b8daaacd15677d8a2c",
"assets/NOTICES": "6a5e3d1844f8c27f42f369532e9ebf90",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "67062dbfc6a5ef9ec78ddfc0242908b2",
"/": "67062dbfc6a5ef9ec78ddfc0242908b2",
"main.dart.js": "b80c4bfc38819b91ecb7707a74a8229d",
"manifest.json": "860b748ee5f825b39d70bfde8e81283e",
"version.json": "14c39c9b98d89e2566caa149e628819b"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
