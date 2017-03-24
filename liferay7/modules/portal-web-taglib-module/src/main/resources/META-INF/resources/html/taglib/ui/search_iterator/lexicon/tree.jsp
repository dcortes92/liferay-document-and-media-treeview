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

<%
List<Long> ancestorIds = new ArrayList<Long>();

// Root will be always the same (home)
long treeFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
String treeFolderTitle = "Home";

long folderId = GetterUtil.getLong((String)request.getAttribute("view.jsp-folderId"));
long repositoryId = GetterUtil.getLong((String)request.getAttribute("view.jsp-repositoryId"));

// Current folder could be different to root
long currFolderId = treeFolderId;
String currFolderTitle = treeFolderTitle;

if (folderId != DLFolderConstants.DEFAULT_PARENT_FOLDER_ID) {
	Folder currFolder = DLAppServiceUtil.getFolder(folderId);
	currFolderId = folderId;
	currFolderTitle = currFolder.getName();

	// We need get all ancestors util root
	List<Folder> ancestors = currFolder.getAncestors();

	// We are simulating the root folder as an ancestor
	ancestorIds.add(DLFolderConstants.DEFAULT_PARENT_FOLDER_ID);

	java.util.ListIterator li = ancestors.listIterator(ancestors.size());

	while(li.hasPrevious()) {
		Folder f = (Folder) li.previous();
		ancestorIds.add(f.getFolderId());
	}
}

%>

<aui:script use="rl-content-tree-view">
	var TREE_CONTAINER = "treeDiv";
	var <portlet:namespace />treeViewNode = A.one('#<portlet:namespace />entriesContainer > #<portlet:namespace />'+TREE_CONTAINER);

	if (typeof <portlet:namespace />treeViewNode === 'undefined' || <portlet:namespace />treeViewNode === null)
	{
		<portlet:namespace />treeView = new A.ContentTreeView(
      	{
      		namespace: '<portlet:namespace />',
      		treeBox: TREE_CONTAINER,
      		treeTarget: A.TreeTargetDL,
      		repositoryId: '<%= repositoryId %>',
      		scopeGroupId: '<%= scopeGroupId %>',
      		rootFolderId:'<%= treeFolderId %>',
      		rootFolderLabel: '<%= treeFolderTitle %>',
      	}
	    );
	}

<%
List<ResultRowSplitterEntry> resultRowSplitterEntries = new ArrayList<ResultRowSplitterEntry>();

if (resultRowSplitter != null) {
	resultRowSplitterEntries = resultRowSplitter.split(searchContainer.getResultRows());
}
else if (!resultRows.isEmpty()) {
	resultRowSplitterEntries.add(new ResultRowSplitterEntry(StringPool.BLANK, resultRows));
}

List<com.liferay.portal.kernel.dao.search.ResultRow> firstResultRows = Collections.emptyList();

if (!resultRowSplitterEntries.isEmpty()) {
	ResultRowSplitterEntry firstResultRowSplitterEntry = resultRowSplitterEntries.get(0);

	firstResultRows = firstResultRowSplitterEntry.getResultRows();
}

for (ResultRowSplitterEntry resultRowSplitterEntry : resultRowSplitterEntries) {
	List<com.liferay.portal.kernel.dao.search.ResultRow> curResultRows = resultRowSplitterEntry.getResultRows();

	for (int i = 0; i < curResultRows.size(); i++) {
		com.liferay.portal.kernel.dao.search.ResultRow row = (com.liferay.portal.kernel.dao.search.ResultRow)curResultRows.get(i);
		List entries = row.getEntries();
		Map<String, Object> rowData = row.getData();
		String entryTitle = (String)rowData.get("title");
		if (rowData.get("folder") != null) {
		%>
			<portlet:namespace />treeView.addContentFolder({
				id : '',
				label: '<%= entryTitle %>',
				shortcut: <%= false %>,
				showCheckbox: '',
				rowCheckerId: '',
				rowCheckerName: '',
				parentFolderId: '<%= treeFolderId %>',
				previewURL:'',
				viewURL: ''
			});
		<%
		}
		else {
		%>
			<portlet:namespace />treeView.addContentEntry({
				id : '<%= row.getPrimaryKey() %>',
				label: '<%= entryTitle %>',
				shortcut: <%= false %>,
				showCheckbox: '',
				rowCheckerId: '',
				rowCheckerName: '',
				parentFolderId: '<%= treeFolderId %>',
				previewURL:'',
				viewURL: ''
			});
		<%
		}
	}
}
%>
</aui:script>

<%-- <%@ include file="/html/taglib/ui/search_iterator/lexicon/bottom.jspf" %> --%>
