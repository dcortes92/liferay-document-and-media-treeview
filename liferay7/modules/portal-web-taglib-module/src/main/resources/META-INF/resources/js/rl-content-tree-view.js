/**
 * Copyright (C) 2005-2014 Rivet Logic Corporation.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc., 51
 * Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

AUI.add('rl-content-tree-view', function(A) {
    A.ContentTreeView = A.Base.create('rl-content-tree-view', A.Base, [], {
        contentTree: null,
        initializer: function() {
            this.contentTree = new A.TreeViewDD({
                boundingBox: '#myTreeView',
                children: [{
                    children: [{
                            label: 'Watermelon',
                            leaf: true,
                            type: 'check'
                        },
                        {
                            label: 'Apricot',
                            leaf: true,
                            type: 'check'
                        },
                        {
                            label: 'Pineapple',
                            leaf: true,
                            type: 'check'
                        },
                        {
                            label: 'Kiwi',
                            leaf: true,
                            type: 'check'
                        },
                        {
                            label: 'Orange',
                            leaf: true,
                            type: 'check'
                        },
                        {
                            label: 'Pomegranate',
                            leaf: true,
                            type: 'check'
                        }
                    ],
                    expanded: true,
                    label: 'Checkboxes'
                }]
            }).render();
        },

    }, {
        ATTRS: {

            namespace: {
                value: null
            },
            treeBox: {
                value: null
            },
            treeTarget: {
                value: null
            },
            repositoryId: {
                value: null
            },
            scopeGroupId: {
                value: null
            },
            rootFolderId: {
                value: null
            },
            rootFolderLabel: {
                value: null
            },
            checkAllId: {
                value: null
            },
            viewPageBaseURL: {
                value: null
            },
            shortcutImageURL: {
                value: null
            },
            defaultArticleImage: {
                value: null
            },
            defaultDocumentImagePath: {
                value: null
            }
        }
    });

}, '1.0.0', {
    requires: ['aui-tree-view', 'json', 'liferay-portlet-url', 'handlebars', 'liferay-preview', 'aui-loading-mask-deprecated', 'async-queue']
});
