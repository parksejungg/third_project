<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/js.css/about.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <title>M:美</title>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    
</head>
<body>
<%@ include file="/WEB-INF/views/includes/mouse.jsp" %>
      <%@ include file="/WEB-INF/views/includes/header.jsp" %>
    <div class="entire">
        <div class="A_title" data-aos="fade-down">
            WE ARE,
        </div>
        
        <div class="A_content">
            <div class="A_content_L" data-aos="fade-down-right">
                <img src="/resources/img/js_img/여름빛깔.jpg" alt="여름 빛-깔">
            </div>
            <div class="A_content_R" data-aos="fade-down-left">
                여러분은 출근길과 퇴근길의 색을 집중하여 보신 적이 있나요?<br><br>
                M:美는 여러분에게 고정적이고 틀에 박힌 루틴에서 벗어나 주변이 어떤 색을 가졌는지, 나아가 여러분의 매 시간은 어떤 색을 띄는지 여러분 자신에게 집중하는 시간을 드리고자 만들어졌습니다.<br><br>
                내일 원래의 바쁜 일상으로 돌아가더라도 오늘은 오늘의 빛을 즐기며 소중한 하루를 보내시길 바랍니다.<br><br>
                M:美입니다.
            </div>
        </div>
        <div class="A_blank"></div>
        <hr class="underbar">
        <div class="A_blank"></div>
        <div class="A_artists" data-aos="fade-down" data-aos-once="false">
            Artists With,
        </div>
        <div class="artists_list">
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint1.jpg" alt="paint1">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint2.jpg" alt="paint2">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint3.jpg" alt="paint3">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint4.jpg" alt="paint4">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint5.jpg" alt="paint5">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint6.jpg" alt="paint6">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint7.jpg" alt="paint7">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint8.jpg" alt="paint8">
            </div>
            <div class="artists_paint">
                <img src="/resources/img/js_img/paint9.jpg" alt="paint9">
            </div>
        </div>
        <div class="A_blank"></div>
        <div class="A_en_content">
            <div class="A_en_content_L" data-aos="fade-down-right" data-aos-once="false">
                Have you ever focused on the colors on your commute?<br><br>
                M:美 was created to give you time to focus on yourself, what color your surroundings are, and what color your every hour is, away from the fixed and stereotyped routine.
            </div>
            <div class="A_blank"></div>
            <div class="A_blank"></div>
            <div class="A_en_content_R" data-aos="fade-down-left" data-aos-once="false">
                Even if you go back to your busy daily life tomorrow, I hope today will be a day where you can enjoy today's light and focus solely on yourself.
            </div>
            <br/>
            <br/>
            <br/>
        </div>
    </div>
    <script src="/resources/js/js.js/about.js"></script>
    <script>
       AOS.init();
    </script>	
    <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>
