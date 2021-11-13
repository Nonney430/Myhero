'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "e5263d36aa480f264f307d0d995efd98",
"assets/assets/images/1.jpg": "6df919a27877d79691994e3eba95bb8c",
"assets/assets/images/10.jpg": "8b036f476f19a395003798997310b45d",
"assets/assets/images/11.jpg": "14470233f2d1b9d7b909236b1859d161",
"assets/assets/images/12.jpg": "b54638fc869f8f8e70db6bb6747b3a35",
"assets/assets/images/13.jpg": "04ed287a32bcc2c821ff65898301e02d",
"assets/assets/images/14.jpg": "a4f1af18b65bc89d10f7291ed58ae27c",
"assets/assets/images/15.jpg": "de50f298222227aa8092f0244a7fa888",
"assets/assets/images/16.jpg": "88e8aafeabe15740db100af316975995",
"assets/assets/images/17.jpg": "f79d0ac4f1c22eb49b86a378243e3ddd",
"assets/assets/images/18.jpg": "0121b98d489b01c72150a9c387e1318b",
"assets/assets/images/19.jpg": "e85f6f1b92c135037f74cabeb90b8c5f",
"assets/assets/images/2.jpg": "074cdb19faadef18650da193758a2b05",
"assets/assets/images/20.jpg": "f14e01fbcfd60f77fabae38157086877",
"assets/assets/images/21.jpg": "0c6899efa6ad1c73256a01efcf774ccf",
"assets/assets/images/22.jpg": "0d6256dfd7e075d5cc785c4e8fd5dcd6",
"assets/assets/images/23.jpg": "e8155dd22bd441b730343bf2968a9c17",
"assets/assets/images/24.jpg": "0180cf095f5cba0ed6fd336c4b1a6660",
"assets/assets/images/25.jpg": "203ec90fa4e0b6e761085ff5e6cb4496",
"assets/assets/images/26.jpg": "23ee91402c2a5195e6baa0a02db6faf4",
"assets/assets/images/27.jpg": "ab8848790d9ef465bf960ff6d3fc6960",
"assets/assets/images/28.jpg": "a2c0bcd30f0130b09a4ba22bda1b64a2",
"assets/assets/images/29.jpg": "c06836e0f0310e2c54a158475796b665",
"assets/assets/images/3.jpg": "2e3662bf8d5eec9ba81fbb68587f8807",
"assets/assets/images/30.jpg": "d9e8f6e7599aa72c61109424ccb50232",
"assets/assets/images/31.jpg": "20dde76797d22f54c4871ec0eca7f547",
"assets/assets/images/32.jpg": "109549465e8806872127bbc889b4773d",
"assets/assets/images/4.jpg": "4c597e8a016c658c95669fd56868203b",
"assets/assets/images/5.jpg": "29ca8c7040d23bb1143d743288489329",
"assets/assets/images/6.jpg": "2663434c8f7a14b0eea94d4571f4c797",
"assets/assets/images/7.jpg": "853c82c4f9a1e7a4132e77a12c421dc6",
"assets/assets/images/8.jpg": "4c9bb37540d2e0bb4ec68f0b78496fd8",
"assets/assets/images/9.jpg": "a13f403e9109df39e27e81a2cbd03988",
"assets/assets/images/my-hero.png": "a8409a6b4d10da54d3dec89c9cc7753d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "0d5876fdd7d4f228837c119010557130",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "658df5ac61e860c4446cec3273dfe8fc",
"/": "658df5ac61e860c4446cec3273dfe8fc",
"main.dart.js": "db70fde8654d9deff6ab2759252ed479",
"manifest.json": "4b8cfb813d9e97d2f40711c7162b3b2f",
"version.json": "f956e53c02728d6b97566a4a5d080ca3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
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
