<%--
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
--%>

<%-- RivetLogic Custom BEGINS --%>

<%
String TREE_VIEW = "tree";
String[] DISPLAY_VIEWS = new String[0];
if (themeDisplay.isSignedIn()) {
  String[] displayViews = dlPortletInstanceSettings.getDisplayViews();
  int newDisplayIdx = displayViews.length;
  DISPLAY_VIEWS = Arrays.copyOf(displayViews, displayViews.length + 1);
  DISPLAY_VIEWS[newDisplayIdx] = "tree";
}
%>

<aui:script use="aui-base">
var <portlet:namespace />treeView;
</aui:script>

<%-- RivetLogic Custom ENDS --%>
