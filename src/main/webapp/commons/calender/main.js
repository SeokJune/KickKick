(function($) {

	"use strict";

	//캘린더
	$(document).ready(function() {
		var date = new Date();
		var today = date.getDate();
		// < - 이전 달/ > - 다음 달 
		$(".right-button").click({ date: date }, next_year);
		$(".left-button").click({ date: date }, prev_year);
		$(".month").click({ date: date }, month_click);
		//일정 보기 버튼 클릭 - 수정*** -> my_events
		$("#add-button").click({ date: date }, my_events);
		// 현재 날짜 - 월 세팅
		$(".months-row").children().eq(date.getMonth()).addClass("active-month");
		init_calendar(date);
		var events = check_events(today, date.getMonth() + 1, date.getFullYear());
		show_events(events,months[date.getMonth()], today);
	});

	//캘린더 현재 날짜 설정
	function init_calendar(date) {
		$(".tbody").empty();
		$(".events-container").empty();
		var calendar_days = $(".tbody");
		var month = date.getMonth();
		var year = date.getFullYear();
		var day_count = days_in_month(month, year);
		var row = $("<tr class='table-row'></tr>");
		var today = date.getDate();
		// 해당 월의 1일 위치 찾기
		date.setDate(1);
		var first_day = date.getDay();
		for (var i = 0; i < 35 + first_day; i++) {
			var day = i - first_day + 1;
			// 일요일이 되면 다음주 넘기기
			if (i % 7 === 0) {
				calendar_days.append(row);
				row = $("<tr class='table-row'></tr>");
			}
			// 요일마다 생기는 빈칸 넣기
			if (i < first_day || day > day_count) {
				var curr_date = $("<td class='table-date nil'>" + "</td>");
				row.append(curr_date);
			}
			else {
				var curr_date = $("<td class='table-date'>" + day + "</td>");
				var events = check_events(day, month + 1, year);
				if (today === day && $(".active-date").length === 0) {
					curr_date.addClass("active-date");
					show_events(events,months[month], day);
				}
				// 경기일정있으면 .event-date 클래스 부여
				if (events.length !== 0) {
					curr_date.addClass("event-date");
				}
				// 날짜 클릭을 위한 onClick 핸들러 설정
				curr_date.click({ events: events, month: months[month], day: day }, date_click);
				row.append(curr_date);
			}
		}
		// 마지막 행을 추가하고 현제 년도 설정
		calendar_days.append(row);
		$(".year").text(year);
	}

	// 주어진 달/년 일수 구하기
	function days_in_month(month, year) {
		var monthStart = new Date(year, month, 1);
		var monthEnd = new Date(year, month + 1, 1);
		return (monthEnd - monthStart) / (1000 * 60 * 60 * 24);
	}

	// date클릭 했을때 이벤트 설정 -> 경기일정 개수 나오게 하기!(변수 : game_count)
	function date_click(event) {
		$(".events-container").show(250);
		$("#dialog").hide(250);
		$(".active-date").removeClass("active-date");
		$(this).addClass("active-date");
		show_events(event.data.events,event.data.month, event.data.day);
	};

	// month클릭 했을 때 이벤트 설정 -> 달 이동
	function month_click(event) {
		$(".events-container").show(250);
		$("#dialog").hide(250);
		var date = event.data.date;
		$(".active-month").removeClass("active-month");
		$(this).addClass("active-month");
		var new_month = $(".month").index(this);
		date.setMonth(new_month);
		init_calendar(date);
	}

	// > 클릭 했을 때 -> 다음달로 이동 
	function next_year(event) {
		$("#dialog").hide(250);
		var date = event.data.date;
		var new_year = date.getFullYear() + 1;
		$("year").html(new_year);
		date.setFullYear(new_year);
		init_calendar(date);
	}

	// < 클릭했을 때 -> 이전 달로 이동 
	function prev_year(event) {
		$("#dialog").hide(250);
		var date = event.data.date;
		var new_year = date.getFullYear() - 1;
		$("year").html(new_year);
		date.setFullYear(new_year);
		init_calendar(date);
	}

	// 일정보기 버튼을 클릭했을 때 ->  수정해야함***
	function my_events(event) {
		$(".events-container").hide(250);
		$("#dialog").show(250);
		// 닫기 버튼
		$("#cancel-button").click(function() {
			$("#dialog").hide(250);
			$(".events-container").show(250);
		});
	}

	// 일 클릭 했을때 경기 몇개있는지 나오게 하기 -> 수정해야함!*** -> 비동기로 구현
	function show_events(events,month, day) {
		// Clear the dates container
		// 컨테이너 날짜 지우기?
		$(".events-container").empty();
		$(".events-container").show(250);
		console.log(event_data["events"]);
		// 날짜누르면 해당 경기 일정 개수 뜨게하기
		if (events.length === 0) { //경기 일정 0개일때
			var event_card = $("<div class='event-card'></div>");
			// 일정 불러오기 해서 변수 game_count 집어넣기
			var event_name = $("<div class='event-name'>" + month + "월 " + day + "일의 경기일정은 0 개 입니다.</div>");
			$(event_card).css({ "border-left": "10px solid #FF1744" });
			$(event_card).append(event_name);
			$(".events-container").append(event_card);
		} else {
			var event_card = $("<div class='event-card'></div>");
			// 일정 불러오기 해서 변수 game_count 집어넣기
			var event_name = $("<div class='event-name'>" + month + "월 " + day + "일의 경기일정은 n 개 입니다.</div>");
			$(event_card).css({ "border-left": "10px solid #FF1744" });
			$(event_card).append(event_name);
			$(".events-container").append(event_card);
			//$.ajax({
			//	url: "/my_events.team",
			//	type:"post",
			//	data:{
			//		year: year,
			//		month: month,
			//		day: day
			//	}
			//});
		}
	}

	// 특정 날짜에 이벤트가 있는지확인하기
	function check_events(day, month, year) {
		var events = [];
		for (var i = 0; i < event_data["events"].length; i++) {
			var event = event_data["events"][i];
			if (event["day"] === day &&
				event["month"] === month &&
				event["year"] === year) {
				events.push(event);
			}
		}
		return events;
	}

	// Given data for events in JSON format
	var event_data = {
		"events": [
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10,
				"cancelled": true
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10,
				"cancelled": true
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10,
				"cancelled": true
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10,
				"cancelled": true
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10,
				"cancelled": true
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10,
				"cancelled": true
			},
			{
				"occasion": " Repeated Test Event ",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 10
			},
			{
				"occasion": " Test Event",
				"invited_count": 120,
				"year": 2020,
				"month": 5,
				"day": 11
			}
		]
	};

	const months = [
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10",
		"11",
		"12"
	];

})(jQuery);
