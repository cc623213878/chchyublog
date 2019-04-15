<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div id="sidebar">
    <!-- Logo -->
    <div id="logo">
        <h1 class="mobileUI-site-name">chchyu</h1>
    </div>

    <!-- Nav -->
    <nav id="nav" class="mobileUI-site-nav">
        <ul>
            <li class="current_page_item"><a href="#"></a></li>
            <li><a href="#">我的文章</a></li>
            <li><a href="#">关于我</a></li>
            <li><a href="#">给我留言</a></li>
        </ul>
    </nav>

    <!-- Search -->
    <section class="is-search is-first">
        <form method="post" action="#">
            <input type="text" class="text" name="search" placeholder="Search" />
        </form>
    </section>

    <!-- Recent Posts -->
    <section class="is-recent-posts">
        <header>
            <h3>点击热门</h3>
        </header>
        <ul>
            <li><a href="#">Nothing happened</a></li>
            <li><a href="#">My Dearest Cthulhu</a></li>
            <li><a href="#">The Meme Meme</a></li>
            <li><a href="#">Now Full Cyborg</a></li>
            <li><a href="#">Temporal Flux</a></li>
        </ul>
    </section>

    <!-- Calendar -->
    <section class="is-calendar">
        <div class="inner">
            <table>
                <caption id="calendar-date"></caption>
                <thead>
                    <tr>
                        <th scope="col" title="Sunday">日</th>
                        <th scope="col" title="Monday">一</th>
                        <th scope="col" title="Tuesday">二</th>
                        <th scope="col" title="Wednesday">三</th>
                        <th scope="col" title="Thursday">四</th>
                        <th scope="col" title="Friday">五</th>
                        <th scope="col" title="Saturday">六</th>
                    </tr>
                </thead>
                <tbody id="calendartbody">

                </tbody>
            </table>
        </div>
    </section>

    <!-- Copyright -->
    <div id="copyright">
        <p>
            &copy; 2019 blog.chchyu.cn
        </p>
    </div>

</div>
<script>
    //判断闰年
    function runNian(_year) {
        if (_year % 400 === 0 || (_year % 4 === 0 && _year % 100 !== 0)) {
            return true;
        } else {
            return false;
        }
    } //判断某年某月的1号是星期几
    function getFirstDay(_year, _month) {
        var allDay = 0,
            y = _year - 1,
            i = 1;
        allDay = y + Math.floor(y / 4) - Math.floor(y / 100) + Math.floor(y / 400) + 1;
        for (; i < _month; i++) {
            switch (i) {
                case 1:
                    allDay += 31;
                    break;
                case 2:
                    if (runNian(_year)) {
                        allDay += 29;
                    } else {
                        allDay += 28;
                    }
                    break;
                case 3:
                    allDay += 31;
                    break;
                case 4:
                    allDay += 30;
                    break;
                case 5:
                    allDay += 31;
                    break;
                case 6:
                    allDay += 30;
                    break;
                case 7:
                    allDay += 31;
                    break;
                case 8:
                    allDay += 31;
                    break;
                case 9:
                    allDay += 30;
                    break;
                case 10:
                    allDay += 31;
                    break;
                case 11:
                    allDay += 30;
                    break;
                case 12:
                    allDay += 31;
                    break;
            }
        }
        return allDay % 7;
    }
    //显示日历
    function showCalendar(_year, _month, _day, firstDay) {
        var i = 0,
            monthDay = 0,
            showStr = "",
            _classname = "",
            today = new Date();
        //月份的天数
        switch (_month) {
            case 1:
                monthDay = 31;
                break;
            case 2:
                if (runNian(_year)) {
                    monthDay = 29;
                } else {
                    monthDay = 28;
                }
                break;
            case 3:
                monthDay = 31;
                break;
            case 4:
                monthDay = 30;
                break;
            case 5:
                monthDay = 31;
                break;
            case 6:
                monthDay = 30;
                break;
            case 7:
                monthDay = 31;
                break;
            case 8:
                monthDay = 31;
                break;
            case 9:
                monthDay = 30;
                break;
            case 10:
                monthDay = 31;
                break;
            case 11:
                monthDay = 30;
                break;
            case 12:
                monthDay = 31;
                break;
        }

        showStr += "<tr> ";
        //当月第一天前的空格
        for (i = 1; i <= firstDay; i++) {
            showStr += "<td></td>";
        } //显示当前月的天数 
        for (i = 1; i <= monthDay; i++) { //当日的日期 
            if (_year === today.getFullYear() && _month === today.getMonth() + 1 &&
                i === _day) {
                showStr += "<td class='today'><a>" + i + "</a></td>";
            } else {
                showStr += "<td>" + i + "</td>";
            }

            //把日期存在对应的value

            firstDay = (firstDay + 1) % 7;
            if (firstDay === 0 && i !== monthDay) {
                showStr += "</tr> <tr> ";
            }
        }
        //剩余的空格
        if (firstDay !== 0) {
            for (i = firstDay; i < 7; i++) {
                showStr += "<td></td>";
            }
        }
        showStr += "</tr>"; //插入calendar的页面结构里 
        $("#calendartbody").html(showStr);
    }
    var myDate = new Date();
    var _year = myDate.getFullYear(),
        _month = myDate.getMonth() + 1,
        _day = myDate.getDate();
    $("#calendar-date").text(_year + "-" + _month);
    var firstDay = getFirstDay(_year, _month);
    showCalendar(_year, _month, _day, firstDay);
</script>