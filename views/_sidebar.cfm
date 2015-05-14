<cfoutput>
<div id="sidebar">
	<div id="sidebar-wrap1">
		<div id="sidebar-wrap2">
			<!--- TODO: any way to make these dynamic and configure the ordering? --->
			#cb.event("cbui_BeforeSideBar")#
			<ul id="sidelist">
				<!--- Search --->
				<li>
					<div id="searchtab">
						<div class="inside">
							<form method="get" id="searchform" action="#cb.isPageView() ? cb.linkContentSearch() : cb.linkSearch()#">
								<input type="text" name="q" id="searchbox" size="16" class="searchfield" value="Search For..." onfocus="if(this.value == 'Search For...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search For...';}" />
								<input type="submit" value="Go" class="searchbutton" />
							</form>
						</div>
					</div>
				</li>
				<!--- Categories --->
				<li>
					<ul id="categories" class="nav">
						#cb.quickCategories()#
					</ul>
				</li>
				<!--- Recent Posts --->
				<li>
					<div id="recent-posts" class="widget widget_recent_entries">
						#cb.widget(name="RecentEntries",args={title="Recent Posts"})#
					</div>
				</li>
				<!--- Recent Comments --->
				<li>
					<div id="recent-comments" class="widget widget_recent_comments">
						#cb.widget(name="RecentComments",args={title="Recent Comments"})#
					</div>
				</li>
				<!--- Archives --->
				<li>
					<div id="monthly-archives" class="widget widget_archive">
						#cb.widget(name="Archives",args={title="Archives"})#
					</div>
				</li>
			</ul>
			#cb.event("cbui_afterSideBar")#
		</div>
	</div>
</div>
</cfoutput>