<%@ include file="/WEB-INF/jsp/common/init.jsp"%>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />-->

<title>${_sysTitle}</title>
<link rel="shortcut icon" href="${ctx}/images/favicon.ico">
<link rel="icon" type="image/gif" href="${ctx}/images/favicon.gif">

<link href="${ctx}/css/base.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/css/main.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/css/menu.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="${ctx}/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/tabscroll.js"></script>
<script type="text/javascript"
	src="${ctx}/js/jquery/mbMenu/jquery.metadata.js"></script>
<script type="text/javascript"
	src="${ctx}/js/jquery/mbMenu/jquery.hoverIntent.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/mbMenu/mbMenu.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/dhtmlx3/dhtmlxgrid.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/js/dhtmlx3/skins/dhtmlxgrid_dhx_skyblue.css" />
<script type="text/javascript" src="${ctx}/js/jquery/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/common.js"></script>
<script type="text/javascript" src="${ctx}/js/dhtmlx3/dhtmlxcommon.js"></script>
<script type="text/javascript" src="${ctx}/js/dhtmlx3/dhtmlxgrid.js"></script>
<script type="text/javascript" src="${ctx}/js/dhtmlx3/dhtmlxgridcell.js"></script>
<script type="text/javascript" src="${ctx}/js/dhtmlx3/excells/dhtmlxgrid_excell_link.js"></script>
<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>

<style>
html,body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.page_wrap {
	background-color: white;
}
.panel { 
	width: 			98%;
	border-left: 	1px solid #0050D0;
	border-right: 	1px solid #0050D0;
	border-top: 	1px solid #0050D0;
	border-bottom: 	1px solid #0050D0;
	margin-left: 	1px;
	margin-right: 	1px;
}
.head { 
	font-size: 		13px;
	color:			white;
	margin:			1px;
	padding: 		4px; 
	background: 	#0272A2; 
}
.content { 
	padding: 		5px;
	text-indent: 	2px; 
	border-top: 	1px solid #0050D0;
	width: 			99%;
}
#mxTable td{
	padding: 		3px;
	margin:	 		3px;
	font-size: 		15px;
}
#monTable th {
	 border: 1px solid #a5acb5;
	 background: url("${ctx}/images/header.png") repeat-x scroll 0 0 #e7ebef;
	 text-align: center;
	 width: 8.3%;
}
#monTable td {
	 border: 1px solid #a5acb5;
	 background-color: #fff;
}
#monTable td input {
	 border: 0px;
	 text-align: center;
}
</style>
</head>
<body>
	<div id="page_wrap" class="page_wrap" style = "width:800px;margin-right:8px">
			<div class="grid-top"style = "margin-top:8px">
				<div style="width:400px;float: left;"><span>操作记录</span></div>
			</div>
			<div class="grid-content">
				<div id="gridbox"  style="width: 100%;height: 240px;"></div>
			</div>
			<input type="button" value="tick me"/>
	</div>
<script type="text/javascript">
	// 初始化grid
	var month = "${month}";
	var unitid = "${unitid}";
	var dataGrid;
	function initDataGrid() {
		dataGrid = new dhtmlXGridObject("gridbox");
		dataGrid.setImagePath("${ctx}/js/dhtmlx3/imgs/");
		dataGrid.setHeader("序号,操作状态,购电类型,操作备注,操作人,操作时间");
		dataGrid.setColSorting("str,str,str,str,str,str");
		dataGrid.setColTypes("ro,ro,ro,ro,ro,ro");
		dataGrid.setInitWidths("50,80,80,*,80,130");
		dataGrid.setColAlign("center,center,center,center,center,center");
		dataGrid.enableAutoHeight(false);
		dataGrid.setSkin("dhx_skyblue");
		dataGrid.init();
	}
	
	function refreshData() {
		if (dataGrid) {
			dataGrid.clearAll();
		    var url = "${ctx}/sbs/fdrealelectricunitinfo.do?method=logData&month="+month+"&unitid="+unitid;
			dataGrid.loadXML(url);
		}
	}
	jQuery(function($) {
		initDataGrid();
		refreshData();
	});
</script>
</body>
</html>
