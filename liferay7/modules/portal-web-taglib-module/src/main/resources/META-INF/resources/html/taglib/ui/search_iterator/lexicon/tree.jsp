<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/taglib/ui/search_iterator/init.jsp" %>

<%-- <%@ include file="/html/taglib/ui/search_iterator/lexicon/top.jspf" %> --%>

<div id="myTreeView">

</div>

<aui:script>
  AUI().use('aui-tree-view', function (A) {
    new A.TreeViewDD(
      {
        boundingBox: '#myTreeView',
        children: [
          {
            children: [
              {label: 'Watermelon', leaf: true, type: 'check'},
              {label: 'Apricot', leaf: true, type: 'check'},
              {label: 'Pineapple', leaf: true, type: 'check'},
              {label: 'Kiwi', leaf: true, type: 'check'},
              {label: 'Orange', leaf: true, type: 'check'},
              {label: 'Pomegranate', leaf: true, type: 'check'}
            ],
            expanded: true,
            label: 'Checkboxes'
          },
          {
            children: [
              {label: 'Watermelon', leaf: true, type: 'radio'},
              {label: 'Apricot', leaf: true, type: 'radio'},
              {label: 'Pineapple', leaf: true, type: 'radio'},
              {label: 'Kiwi', leaf: true, type: 'radio'},
              {label: 'Orange', leaf: true, type: 'radio'},
              {label: 'Pomegranate', leaf: true, type: 'radio'}
            ],
            expanded: true,
            label: 'Radio'
          },
          {
            children: [
              {label: 'Watermelon', leaf: true, type: 'task'},
              {label: 'Apricot', leaf: true, type: 'task'},
              {label: 'Pineapple', leaf: true,  type: 'task'},
              {label: 'Kiwi', leaf: true, type: 'task'},
              {label: 'Orange', leaf: true, type: 'task'},
              {label: 'Pomegranate', leaf: true,  type: 'task'}
            ],
            expanded: true,
            label: 'Task',
            type: 'task'
          }
        ]
      }
    ).render();
  });
</aui:script>

<%-- <%@ include file="/html/taglib/ui/search_iterator/lexicon/bottom.jspf" %> --%>
