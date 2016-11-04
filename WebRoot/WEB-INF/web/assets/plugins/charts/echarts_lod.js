
function ss(myChart) {
	myChart.setOption({//图形
		tooltip : {
			trigger : 'axis',
			backgroundColor : 'rgba(255,255,255,0.7)',
			borderColor : 'black',
			borderRadius : 5,
			borderWidth : 2,
			textStyle : {
				color : 'black',
				decoration : 'none'
			},
			axisPointer : {
				type : 'line',
				lineStyle : {
					color : '#C0C0C0',
					width : 2,
					type : 'dotted'
				}
			}
		},
		legend : {
			data : [ '浏览PV', '浏览UV' ]
		},
		calculable : false,
		animation : true,//是否启用初始化动画
		xAxis : [ {
			type : 'category',
			boundaryGap : false,
			axisTick : {
				onGap : false
			},
			splitLine : {
				show : false
			},
			data : testX(label)
		} ],
		yAxis : [ {
			type : 'value',
			scale : true,
			axisLabel : {
				formatter : '{value}'
			}
		} ],
		series : [ {
			name : '浏览PV',
			type : 'line',
			smooth : true,
			data : testY()
		}, {
			name : '浏览UV',
			type : 'line',
			smooth : true,
			data : testY2()
		} ]
	}, true);//图形展示
	window.onresize = myChart.resize;
}