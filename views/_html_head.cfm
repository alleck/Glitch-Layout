<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
<head profile="http://gmpg.org/xfn/11">
	<title>
		<cfset title = cb.siteName() />
		<cfif cb.isEntryView() >
			<cfset title = cb.getCurrentEntry().getTitle() & " &raquo; " & title />
		<cfelseif cb.isPageView() AND ( cb.getCurrentPage().getSlug() NEQ cb.getHomePage() ) >
			<cfset title = cb.getCurrentPage().getTitle() & " &raquo; " & title />
		<cfelseif len( cb.siteTagLine() ) >
			<cfset title = title & " &raquo; " & cb.siteTagLine() />
		</cfif>
		#title#
	</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="generator" content="ContentBox #cb.getContentBoxVersion()#" />
	<cfif cb.isEntryView() AND len( cb.getCurrentEntry().getHTMLDescription() ) >
		<meta name="description" content="#cb.getCurrentEntry().getHTMLDescription()#" />
	<cfelseif cb.isPageView() AND len( cb.getCurrentPage().getHTMLDescription() ) >
		<meta name="description" content="#cb.getCurrentPage().getHTMLDescription()#" />
	<cfelseif len( cb.siteDescription() ) >
		<meta name="description" content="#HTMLEditFormat( cb.siteDescription() )#" />
	</cfif>
	<cfif cb.isEntryView() AND len( cb.getCurrentEntry().getHTMLKeywords() ) >
		<meta name="keywords" content="#cb.getCurrentEntry().getHTMLKeywords()#" />
	<cfelseif cb.isPageView() AND len( cb.getCurrentPage().getHTMLKeywords() ) >
		<meta name="keywords" content="#cb.getCurrentPage().getHTMLKeywords()#" />
	<cfelseif len( cb.siteKeywords() ) >
		<meta name="keywords" content="#cb.siteKeywords()#" />
	</cfif>
	<meta name="robots" content="index, follow" />
	<base href="#cb.siteBaseURL()#" />
	<cfif !cb.setting("cb_site_disable_blog") >
		<link rel="alternate" type="application/rss+xml" title="Recent Blog Updates" href="#cb.linkRSS()#" />
		<link rel="alternate" type="application/rss+xml" title="Recent Blog Comment Updates" href="#cb.linkRSS(comments=true)#" />
	</cfif>
	<link rel="alternate" type="application/rss+xml" title="Recent Page Updates" href="#cb.linkPageRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Page Comment Updates" href="#cb.linkPageRSS(comments=true)#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Content Updates" href="#cb.linkSiteRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Content Comment Updates" href="#cb.linkSiteRSS(comments=true)#" />
	<link href="#cb.layoutRoot()#/includes/css/style.css" rel="stylesheet" type="text/css" />
	<!--[if lte IE 6]>
		<script type="text/javascript">
			/* <![CDATA[ */
				blankimgpath = "#cb.layoutRoot()#/includes/images/blank.gif";
			 /* ]]> */
		</script>
		<style type="text/css" media="screen">
			@import "#cb.layoutRoot()#/includes/css/ie6.css";
			body{ behavior:url("#cb.layoutRoot()#/includes/js/ie6hoverfix.htc"); }
			img{ behavior: url("#cb.layoutRoot()#/includes/js/ie6pngfix.htc"); }
		</style>
	<![endif]-->
	<link href="#cb.layoutRoot()#/includes/css/custom.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/jquery.min.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/fusion.js"></script>
	<script type="text/javascript">
		/* <![CDATA[ */
			jQuery(document).ready(function() {
				if (jQuery.browser.safari) jQuery('body').addClass('safari');
				jQuery("##layoutcontrol a").click(function() {
					switch (jQuery(this).attr("class")) {
						case 'setFont':
							setFontSize();
							break;
						case 'setLiquid':
							setPageWidth();
							break;
					}
					return false;
				});
				var font_size = jQuery.cookie('fontSize');
				if (font_size == '.85em') { jQuery('body').css("font-size",".85em"); }
				if (font_size == '.95em') { jQuery('body').css("font-size",".95em"); }
				if (font_size == '1.1em') { jQuery('body').css("font-size","1.1em"); }
				var page_width = jQuery.cookie('pageWidth');
				if (page_width) jQuery('##page').css('width', page_width);
				jQuery('##secondary-tabs').minitabs(333, 'slide');
				if (document.all && !window.opera && !window.XMLHttpRequest && jQuery.browser.msie) {
					var isIE6 = true;
				} else {
					var isIE6 = false;
				}
				jQuery.browser.msie6 = isIE6;
				if (!isIE6) {
					initTooltips({
						timeout: 6000
					});
				}
				tabmenudropdowns();
				jQuery('##sidebar ul.nav li ul li a').mouseover(function () {
					jQuery(this).animate({ marginLeft: "4px" }, 100 );
				});
				jQuery('##sidebar ul.nav li ul li a').mouseout(function () {
					jQuery(this).animate({ marginLeft: "0px" }, 100 );
				});
				jQuery("a##toplink").click(function(){
					jQuery('html, body').animate({scrollTop:0}, 'slow');
				});
			});
		/* ]]> */
	</script>
	#cb.event("cbui_beforeHeadEnd")#
</head>
</cfoutput>