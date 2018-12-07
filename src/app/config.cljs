
(ns app.config (:require [app.util :refer [get-env!]]))

(def bundle-builds #{"release" "local-bundle"})

(def dev?
  (if (exists? js/window)
    (do ^boolean js/goog.DEBUG)
    (not (contains? bundle-builds (get-env! "mode")))))

(def site
  {:storage-key "storage",
   :port 11005,
   :title "Checklist",
   :icon "http://cdn.tiye.me/logo/cumulo.png",
   :dev-ui "http://localhost:8100/main.css",
   :release-ui "http://cdn.tiye.me/favored-fonts/main.css",
   :cdn-url "http://cdn.tiye.me/checklist/",
   :cdn-folder "tiye.me:cdn/checklist",
   :upload-folder "tiye.me:repo/TopixIM/checklist/",
   :server-folder "tiye.me:servers/checklist",
   :theme "#eeeeff"})
