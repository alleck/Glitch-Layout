<cfset isHomePage = false />
<!--- TODO: Change below code to only use isBlogView() when CONTENTBOX-525 is fixed --->
<cfif ( cb.isPageView() AND ( cb.getHomePage() EQ cb.getCurrentPage().getSlug() ) ) OR
	( ( cb.isBlogView() OR event.getCurrentEvent() EQ "contentbox-ui:blog.archives" ) AND ( cb.getHomePage() EQ "cbBlog" ) ) >
	<cfset isHomePage = true />
</cfif>
<cfoutput>
<div id="header">
	<h1 id="title"><a href="#cb.siteBaseURL()#">#cb.siteName()#</a></h1>
	<div id="tabs">
	<cfif len( cb.siteTagLine() ) >
		<div id="topnav" class="description">
			#cb.siteTagLine()#
		</div>
	</cfif>
		<ul>
			<li<cfif isHomePage > class="current_page_item"</cfif>><a href="#cb.linkHome()#"><span><span>Home</span></span></a></li>
			<!--- Blog link when not designated as the home page view and not disabled (move where wanted) --->
			<cfif cb.getHomePage() NEQ "cbBlog" AND !cb.setting("cb_site_disable_blog") >
				<li<cfif cb.isBlogView() OR event.getCurrentEvent() EQ "contentbox-ui:blog.archives" > class="current_page_item"</cfif>><a href="#cb.linkBlog()#"><span><span>Blog</span></span></a></li>
			</cfif>
			<cfset rootMenu = cb.rootMenu( type="data", levels="2" ) />
			<cfloop array="#rootMenu#" index="idx">
				<cfif event.buildLink( cb.getHomePage() ) NEQ idx.link >
					<li<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) EQ idx.link > class="current_page_item"</cfif>>
						<a href="#idx.link#"><span><span>#idx.title#</span></span></a>
						<cfif structKeyExists( idx, "subPageMenu" ) >
							<ul>
								<cfloop array="#idx.subPageMenu#" index="idx2">
									<li class="page_item page-item-#idx2.link#"><a href="#idx2.link#" title="#idx2.title#"><span><span>#idx2.title#</span></span></a></li>
								</cfloop>
							</ul>
						</cfif>
					</li>
				</cfif>
			</cfloop>
		</ul>
	</div>
</div>
</cfoutput>