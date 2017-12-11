<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>cryptokitties攻略</title>
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/bootstrap-table.css">
<style type="text/css">
</style>
</head>
<body>
	<h1>cryptokitties</h1>

	<table id="table" data-toggle="table" data-height="460" data-url="/data" data-sort-name="cattributes_sum" data-sort-order="desc" data-side-pagination="server" data-page-size="50"
		data-page-list="[10, 25, 50, 100,500, All]">
		<thead>
			<tr>
				<th data-field="id" data-width="8%" data-align="center" data-formatter="FMT.kittyUrl">id</th>
				<th data-field="image_url" data-width="15%" data-align="center" data-formatter="FMT.kittyImg">图</th>
				<th data-field="kitty_name" data-width="12%" data-align="center" data-formatter="FMT.kittyUrl">名</th>
				<th data-field="generation" data-width="8%" data-sortable="true" data-formatter="FMT.gen">代</th>
				<th data-field="current_price" data-width="10%" data-sortable="true" data-align="right">价</th>
				<th data-field="children_num" data-width="8%" data-sortable="true">孩子数量</th>
				<th data-field="cattributes_sum" data-width="8%" data-sortable="true">属性总分</th>
				<th data-field="cattributes_avg" data-width="8%" data-sortable="true">属性均分</th>
				<th data-field="cattributes" data-width="35%" data-formatter="FMT.cattributes">属性</th>
			</tr>
		</thead>
	</table>


	<script type="text/javascript" src="/static/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript">
		function colorRGB2Hex(color) {
			var rgb = color.split(',');
			var r = parseInt(rgb[0]);
			var g = parseInt(rgb[1]);
			var b = parseInt(rgb[2]);
			var hex = "#"
					+ ((1 << 24) + (r << 16) + (g << 8) + b).toString(16)
							.slice(1);
			return hex;
		}

		for (var i = 0; i < 65; i++) {
			var s = colorRGB2Hex(255 + "," + i * 3 + "," + i * 3);
			$("body")
					.append(
							'<div style="width: 20px;height: 10px;background-color:'+s+'"></div>');
		}

		var FMT = {
			kittyUrl : function(value, row, index) {
				return [ '<a href="https://www.cryptokitties.co/kitty/'+value+'" target="_blank">'
						+ value + '</a>' ].join('');
			},
			gen : function(value, row, index) {
				return [ '<a href="https://www.cryptokitties.co/marketplace?search=gen:"'
						+ value + ' target="_blank">' + value + '</a>' ]
						.join('');
			},
			cattributes : function(value, row, index) {
				var array = eval("(" + row.cattributes_tags + ")");
				for (var i = 0; i < array.length; i++) {
					console.log(array[i]);
				}
			},
			kittyImg : function(value, row, index) {
				return [ '<img alt="'+row.bio+'" title="'+row.bio+'" src="'+row.image_url+'" width="80px" height="80px">' ]
						.join('');
			}
		};
	</script>


	<footer>
		如果有需求和建议，请加Q群469544103<br> 捐助开发者(ETH)<br> 0x23b96A20Fae711ED6D286feAEED437a6831e3dD7<br>
	</footer>
</body>
</html>