;(function() {
    AUI().applyConfig({
        groups: {
            'rl-content-tree-view': {
                base: MODULE_PATH + '/js/',
                combine: Liferay.AUI.getCombine(),
                modules: {
                    'rl-content-tree-view': {
                        path: 'rl-content-tree-view.js',
                        requires: []
                    }
                },
                root: MODULE_PATH + '/js/'
            }
        }
    });
})();
