<cfoutput>
<div class="clearcontent"></div>
<div id="footer">
	<p>
		Powered by <a href="http://www.gocontentbox.org" title="ContentBox">ContentBox #cb.getContentBoxVersion()#</a> |
		Original design by <a href="https://satyrcast.com">SatyrCast Productions</a><br />
		&copy; Copyright #year(now())# <a href="#cb.siteBaseURL()#">#cb.siteName()#</a>
		<cfif !cb.setting("cb_site_disable_blog") >
			| <a class="rss" href="#cb.linkRSS()#" title="Entries (RSS)">Entries (RSS)</a>
		</cfif>
		<a href="##" id="toplink" title="Back to top">&##94;</a>
	</p>
</div>
#cb.event("cbui_footer")#
</cfoutput>