<%@ page import="com.chennan.mysite.cnyy.controller.WebSecurityConfig" %>
<%@ page import="com.chennan.mysite.cnyy.mybatis.entity.Skill" %>
<%@ page import="java.util.List" %>
<%@ page import="static com.chennan.mysite.cnyy.controller.WebSecurityConfig.*" %>
<%@ page import="com.chennan.mysite.cnyy.mybatis.entity.Course" %>
<%@ page import="com.github.promeg.pinyinhelper.Pinyin" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chennan's website &mdash; One Page About Me</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <% String path = request.getContextPath(); %>
    <base href="<%=path%>">

    <!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->

    <link rel="stylesheet" href="/static/css/animate.css">
    <link rel="stylesheet" href="/static/css/flexslider.css">
    <link rel="stylesheet" href="/static/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1012673_q1pp9wrsph.css">

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/ico/apple-touch-icon-57-precomposed.png">

</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">


<nav class="navbar navbar-expand-lg site-navbar navbar-light bg-light" id="pb-navbar">

    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09"
                aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!--<a class="navbar-brand" href="index.html">Alias</a>-->
        <%
            String username = (String) session.getAttribute(WebSecurityConfig.SESSION_USER_KEY);
            String userType = (String) session.getAttribute(WebSecurityConfig.SESSION_USERTYPE_KEY);
            if (username == null) {
        %>
        <a class="navbar-brand" href="/login">登陆</a>
        <%
        } else if (userType.equalsIgnoreCase(WebSecurityConfig.USER_TYPE_ADMINISTRATOR)) {
        %>
        <strong><a class="navbar-brand" href="/manage"><%=username%>
        </a></strong>
        <%
        } else {
        %>
        <a class="navbar-brand" href="/index"><%=username%>
        </a>

        <%
            }
        %>
        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample09">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#section-home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#section-about">About</a></li>
                <%--<li class="nav-item"><a class="nav-link" href="#section-services">Services</a></li>--%>
                <%--<li class="nav-item"><a class="nav-link" href="#section-portfolio">Portfolio</a></li>--%>
                <li class="nav-item"><a class="nav-link" href="#section-resume">Resume</a></li>
                <%--<li class="nav-item"><a class="nav-link" href="#section-blog">Blog</a></li>--%>
                <li class="nav-item"><a class="nav-link" href="#section-contact">Contact</a></li>

            </ul>
        </div>
        <%
            if (username != null) {
        %>
        <a class="navbar-brand" href="/logout">注销</a>
        <%
            }
        %>
    </div>
</nav>
<section class="site-hero" style="background-image: url(/static/images/preview.png);" id="section-home"
         data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row intro-text align-items-center justify-content-center">
            <div class="col-md-10 text-center">
                <h1 class="site-heading site-animate">Howdy, I'm <strong>Chen Nan</strong></h1>
                <p class="lead site-subheading mb-4 site-animate">A Student studying computer science in Beijing Forest
                    University. </p>
                <p class="lead site-subheading mb-4 site-animate">Welcome to my page. </p>
                <p><a href="#section-about" class="smoothscroll btn btn-primary px-4 py-3">More On Me</a></p>
            </div>
        </div>
    </div>
</section> <!-- section -->


<section class="site-section bg-light" id="section-about">
    <div class="container">
        <div class="row mb-5 align-items-center">
            <div class="col-lg-7 pr-lg-5 mb-5 mb-lg-0">
                <a href="/videos"> <img src="/static/images/us1.jpg" alt="Image placeholder" class="img-fluid">
                </a>
            </div>
            <div class="col-lg-5 pl-lg-5">
                <div class="section-heading">
                    <h2>About <strong>Me</strong></h2>
                </div>
                <p class="lead">An happy student who has a very beautiful and nice wife.</p>
                <p class="mb-5">They love each other very much. And now They have lived together with a very cute cat
                    named jitui. They are very happy.</p>

                <p>
                    <a href="#section-contact" class="btn btn-primary px-4 py-2 btn-sm smoothscroll">Leave Message</a>
                    <%--<a href="#" class="btn btn-secondary px-4 py-2 btn-sm">Download CV</a>--%>
                </p>
            </div>
        </div>

        <div class="row pt-5">
            <div class="col-md-3 mb-3">
                <div class="section-heading">
                    <h2>My <strong>Skills</strong></h2>
                </div>
            </div>
            <div class="col-md-9">
                <%
                    List<Skill> newSkillList = (List<Skill>) session.getAttribute(SKILL_KEY);
                    for (Skill skill : newSkillList) {
                %>

                <div class="skill">
                    <h3><%=skill.getSkillName()%>
                    </h3>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: <%=skill.getSkillScore()%>%"
                             aria-valuenow="<%=skill.getSkillScore()%>"
                             aria-valuemin="0" aria-valuemax="100">
                            <span><%=skill.getSkillScore()%>%</span>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</section>

<%--<section class="site-section bg-light">--%>
<%--<div class="container">--%>
<%--<div class="row mb-5">--%>
<%--<div class="col-md-12">--%>
<%--<div class="section-heading text-center">--%>
<%--<h2>Client <strong>Testimonial</strong></h2>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row">--%>
<%--<div class="col-md-6">--%>

<%--<div class="block-47 d-flex mb-5">--%>
<%--<div class="block-47-image">--%>
<%--<img src="/static/images/person_1.jpg" alt="Image placeholder" class="img-fluid">--%>
<%--</div>--%>
<%--<blockquote class="block-47-quote">--%>
<%--<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and--%>
<%--Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the--%>
<%--coast of the Semantics, a large language ocean.&rdquo;</p>--%>
<%--<cite class="block-47-quote-author">&mdash; Ethan McCown, CEO <a href="#">XYZ Inc.</a></cite>--%>
<%--</blockquote>--%>
<%--</div>--%>

<%--</div>--%>
<%--<div class="col-md-6">--%>

<%--<div class="block-47 d-flex mb-5">--%>
<%--<div class="block-47-image">--%>
<%--<img src="/static/images/person_2.jpg" alt="Image placeholder" class="img-fluid">--%>
<%--</div>--%>
<%--<blockquote class="block-47-quote">--%>
<%--<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and--%>
<%--Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the--%>
<%--coast of the Semantics, a large language ocean.&rdquo;</p>--%>
<%--<cite class="block-47-quote-author">&mdash; Craig Gowen, CEO <a href="#">XYZ Inc.</a></cite>--%>
<%--</blockquote>--%>
<%--</div>--%>

<%--</div>--%>

<%--<div class="col-md-6">--%>

<%--<div class="block-47 d-flex mb-5">--%>
<%--<div class="block-47-image">--%>
<%--<img src="/static/images/person_3.jpg" alt="Image placeholder" class="img-fluid">--%>
<%--</div>--%>
<%--<blockquote class="block-47-quote">--%>
<%--<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and--%>
<%--Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the--%>
<%--coast of the Semantics, a large language ocean.&rdquo;</p>--%>
<%--<cite class="block-47-quote-author">&mdash; Ethan McCown, CEO <a href="#">XYZ Inc.</a></cite>--%>
<%--</blockquote>--%>
<%--</div>--%>

<%--</div>--%>
<%--<div class="col-md-6">--%>

<%--<div class="block-47 d-flex mb-5">--%>
<%--<div class="block-47-image">--%>
<%--<img src="/static/images/person_4.jpg" alt="Image placeholder" class="img-fluid">--%>
<%--</div>--%>
<%--<blockquote class="block-47-quote">--%>
<%--<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and--%>
<%--Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the--%>
<%--coast of the Semantics, a large language ocean.&rdquo;</p>--%>
<%--<cite class="block-47-quote-author">&mdash; Craig Gowen, CEO <a href="#">XYZ Inc.</a></cite>--%>
<%--</blockquote>--%>
<%--</div>--%>

<%--</div>--%>

<%--</div>--%>
<%--</div>--%>
<%--</section>--%>


<%--<section class="site-section border-top pb-0" id="section-services">--%>
<%--<div class="container">--%>

<%--<div class="row mb-4">--%>
<%--<div class="col-md-12">--%>
<%--<div class="section-heading text-center">--%>
<%--<h2>My <strong>Services</strong></h2>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row">--%>

<%--<div class="col-md-6 col-lg-4 text-center mb-5">--%>
<%--<div class="site-service-item site-animate" data-animate-effect="fadeIn">--%>
<%--<span class="icon">--%>
<%--<span class="icon-phone3"></span>--%>
<%--</span>--%>
<%--<h3 class="mb-4">Mobile Optimize</h3>--%>
<%--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there--%>
<%--live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics,--%>
<%--a large language ocean.</p>--%>
<%--<p><a href="#" class="site-link">Learn More <i class="icon-chevron-right"></i></a></p>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-6 col-lg-4 text-center mb-5">--%>
<%--<div class="site-service-item site-animate" data-animate-effect="fadeIn">--%>
<%--<span class="icon">--%>
<%--<span class="icon-wallet2"></span>--%>
<%--</span>--%>
<%--<h3 class="mb-4">Increase Revenue</h3>--%>
<%--<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It--%>
<%--is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>--%>
<%--<p><a href="#" class="site-link">Learn More <i class="icon-chevron-right"></i></a></p>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-6 col-lg-4 text-center mb-5">--%>
<%--<div class="site-service-item site-animate" data-animate-effect="fadeIn">--%>
<%--<span class="icon">--%>
<%--<span class="icon-lightbulb"></span>--%>
<%--</span>--%>
<%--<h3 class="mb-4">Intuitive Idea</h3>--%>
<%--<p>Even the all-powerful Pointing has no control about the blind texts it is an almost--%>
<%--unorthographic life One day however a small line of blind text by the name of Lorem Ipsum--%>
<%--decided to leave for the far World of Grammar.</p>--%>
<%--<p><a href="#" class="site-link">Learn More <i class="icon-chevron-right"></i></a></p>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="col-md-6 col-lg-4 text-center mb-5">--%>
<%--<div class="site-service-item site-animate" data-animate-effect="fadeIn">--%>
<%--<span class="icon">--%>
<%--<span class="icon-phone3"></span>--%>
<%--</span>--%>
<%--<h3 class="mb-4">Mobile Optimize</h3>--%>
<%--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there--%>
<%--live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics,--%>
<%--a large language ocean.</p>--%>
<%--<p><a href="#" class="site-link">Learn More <i class="icon-chevron-right"></i></a></p>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-6 col-lg-4 text-center mb-5">--%>
<%--<div class="site-service-item site-animate" data-animate-effect="fadeIn">--%>
<%--<span class="icon">--%>
<%--<span class="icon-wallet2"></span>--%>
<%--</span>--%>
<%--<h3 class="mb-4">Increase Revenue</h3>--%>
<%--<p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It--%>
<%--is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>--%>
<%--<p><a href="#" class="site-link">Learn More <i class="icon-chevron-right"></i></a></p>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-6 col-lg-4 text-center mb-5">--%>
<%--<div class="site-service-item site-animate" data-animate-effect="fadeIn">--%>
<%--<span class="icon">--%>
<%--<span class="icon-lightbulb"></span>--%>
<%--</span>--%>
<%--<h3 class="mb-4">Intuitive Idea</h3>--%>
<%--<p>Even the all-powerful Pointing has no control about the blind texts it is an almost--%>
<%--unorthographic life One day however a small line of blind text by the name of Lorem Ipsum--%>
<%--decided to leave for the far World of Grammar.</p>--%>
<%--<p><a href="#" class="site-link">Learn More <i class="icon-chevron-right"></i></a></p>--%>
<%--</div>--%>
<%--</div>--%>

<%--</div>--%>
<%--</div>--%>
<%--</section>--%>

<%--<section class="site-section" id="section-features">--%>
<%--<div class="container">--%>
<%--<div class="row site-section">--%>
<%--<div class="col-md-8">--%>
<%--<p><img src="/static/images/laptop_1.jpg" alt="" class="img-fluid"></p>--%>
<%--</div>--%>
<%--<div class="col-md-4">--%>
<%--<h3 class="mb-3">Big Benefits for Small Business</h3>--%>
<%--<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic--%>
<%--life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the--%>
<%--far World of Grammar.</p>--%>

<%--<ul class="site-list">--%>
<%--<li class="site-check">Pointing has no control</li>--%>
<%--<li class="site-check">A small river named Duden flows</li>--%>
<%--<li class="site-check">Roasted parts of sentences fly into your mouth</li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="row">--%>
<%--<div class="col-md-8 order-md-2">--%>
<%--<p><img src="/static/images/laptop_1.jpg" alt="" class="img-fluid"></p>--%>
<%--</div>--%>
<%--<div class="col-md-4 order-md-1">--%>
<%--<h3 class="mb-3">All in One Place</h3>--%>
<%--<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic--%>
<%--life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the--%>
<%--far World of Grammar.</p>--%>

<%--<ul class="site-list">--%>
<%--<li class="site-check">Pointing has no control</li>--%>
<%--<li class="site-check">A small river named Duden flows</li>--%>
<%--<li class="site-check">Roasted parts of sentences fly into your mouth</li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>


<%--</div>--%>
<%--</section>--%>


<section class="site-section" id="section-portfolio">
    <div class="container">
        <div class="row">
            <div class="section-heading text-center col-md-12">
                <h2>课<strong>程</strong></h2>
            </div>
        </div>
        <div class="filters">
            <ul>
                <li class="active" data-filter="*">All</li>
                <li data-filter=".<%=Pinyin.toPinyin("必修","")%>">必修</li>
                <li data-filter=".<%=Pinyin.toPinyin("公选","")%>">公选</li>
                <li data-filter=".<%=Pinyin.toPinyin("专选","")%>">专选</li>
                <li data-filter=".<%=Pinyin.toPinyin("视频课","")%>">视频课</li>
                <li data-filter=".<%=Pinyin.toPinyin("体育","")%>">体育</li>
            </ul>
        </div>

        <div class="filters-content">
            <div class="row grid">
                <%
                    List<Course> newCourseList = (List<Course>) session.getAttribute(COURSE_KEY);
                    for (Course course : newCourseList) {
                %>
                <div class="single-portfolio col-sm-2 all <%=Pinyin.toPinyin(course.getCourseType(),"")%>">
                    <div class="relative">
                        <div class="thumb">
                            <div class="overlay overlay-bg"></div>
                            <img class="image img-fluid"
                                 src="/static/images/CourseImages/<%=course.getCourseName()%>.jpg"
                                 alt="">
                        </div>
                        <a href="static/images/CourseImages/<%=course.getCourseName()%>.jpg" class="img-pop-up">
                            <%--<div class="middle">--%>
                            <%--<div class="text align-self-center d-flex"><img src="/static/images/preview.png" alt=""></div>--%>
                            <%--</div>--%>
                        </a>
                    </div>
                    <div class="p-inner">
                        <h4><%=course.getCourseName()%>
                        </h4>
                        <h4><%=course.getCourseScore()%>
                        </h4>
                        <div class="cat"><%=course.getCourseType()%>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
                <%--<div class="single-portfolio col-sm-4 all mockup">--%>
                <%--<div class="relative">--%>
                <%--<div class="thumb">--%>
                <%--<div class="overlay overlay-bg"></div>--%>
                <%--<img class="image img-fluid" src="/static/images/p2.jpg" alt="">--%>
                <%--</div>--%>
                <%--<a href="static/images/p2.jpg" class="img-pop-up">--%>
                <%--&lt;%&ndash;<div class="middle">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="text align-self-center d-flex"><img src="/static/images/preview.png" alt=""></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--<div class="p-inner">--%>
                <%--<h4>Product Box Package Mockup</h4>--%>
                <%--<div class="cat">Mockup</div>--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</section>
<!-- .section -->

<section class="site-section bg-light " id="section-resume">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-5">
                <div class="section-heading text-center">
                    <h2>My <strong>Resume</strong></h2>
                </div>
            </div>
            <div class="col-md-6">
                <h2 class="mb-5">Education</h2>
                <div class="resume-item mb-4">
                    <span class="date"><span class="icon-calendar"></span> September 2016 - Present</span>
                    <h3>Computer Science and Technology</h3>
                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost
                        unorthographic.</p>
                    <span class="school">Beijing Forestry University</span>
                </div>
            </div>
            <div class="col-md-6">
                <h2 class="mb-5">Experience</h2>
                <div class="resume-item mb-4">
                    <span class="date"><span class="icon-calendar"></span> July 2018 - October 2018</span>
                    <h3>Intern</h3>
                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost
                        unorthographic.</p>
                    <span class="school">Bytedance</span>
                </div>
            </div>
        </div>
    </div>
</section> <!-- .section -->

<%--<section class="site-section" id="section-blog">--%>
<%--<div class="container">--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 mb-5">--%>
<%--<div class="section-heading text-center">--%>
<%--<h2>Blog on <strong>Medium</strong></h2>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="row">--%>
<%--<div class="col-sm-6 col-lg-4 mb-4">--%>
<%--<div class="blog-entry">--%>
<%--<a href="#"><img src="/static/images/post_1.jpg" alt="Image placeholder" class="img-fluid"></a>--%>
<%--<div class="blog-entry-text">--%>
<%--<h3><a href="#">Creative Product Designer From Facebook</a></h3>--%>
<%--<p class="mb-4">Even the all-powerful Pointing has no control about the blind texts it is an--%>
<%--almost unorthographic.</p>--%>

<%--<div class="meta">--%>
<%--<a href="#"><span class="icon-calendar"></span> Aug 7, 2018</a>--%>
<%--<a href="#"><span class="icon-bubble"></span> 5 Comments</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="col-sm-6 col-lg-4 mb-4">--%>
<%--<div class="blog-entry">--%>
<%--<a href="#"><img src="/static/images/post_2.jpg" alt="Image placeholder" class="img-fluid"></a>--%>
<%--<div class="blog-entry-text">--%>
<%--<h3><a href="#">Creative Product Designer From Facebook</a></h3>--%>
<%--<p class="mb-4">Even the all-powerful Pointing has no control about the blind texts it is an--%>
<%--almost unorthographic.</p>--%>

<%--<div class="meta">--%>
<%--<a href="#"><span class="icon-calendar"></span> Aug 7, 2018</a>--%>
<%--<a href="#"><span class="icon-bubble"></span> 5 Comments</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--<div class="col-sm-6 col-lg-4 mb-4">--%>
<%--<div class="blog-entry">--%>
<%--<a href="#"><img src="/static/images/post_3.jpg" alt="Image placeholder" class="img-fluid"></a>--%>
<%--<div class="blog-entry-text">--%>
<%--<h3><a href="#">Creative Product Designer From Facebook</a></h3>--%>
<%--<p class="mb-4">Even the all-powerful Pointing has no control about the blind texts it is an--%>
<%--almost unorthographic.</p>--%>

<%--<div class="meta">--%>
<%--<a href="#"><span class="icon-calendar"></span> Aug 7, 2018</a>--%>
<%--<a href="#"><span class="icon-bubble"></span> 5 Comments</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--</div>--%>
<%--</div>--%>
<%--</section>--%>

<section class="site-section" id="section-contact" style="padding-bottom: 1em;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-5">
                <div class="section-heading text-center">
                    <h2>Wanna <strong>Start Contact</strong> With Me?</h2>
                </div>
            </div>

            <div class="col-md-7 mb-5 mb-md-0">
                <form action="/comment/save" class="site-form" method="post">
                    <h3 class="mb-5">Leave a message</h3>
                    <%
                        if (username == null) {
                    %>
                    <p style="color: orangered"><strong>请登陆后留言</strong></p>
                    <%
                        }
                    %>
                    <%--<div class="form-group">--%>
                    <%--<input type="email" class="form-control px-3 py-4" placeholder="Your Email">--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                    <%--<input type="email" class="form-control px-3 py-4" placeholder="Your Phone">--%>
                    <%--</div>--%>
                    <div class="form-group mb-5">
                        <textarea class="form-control px-3 py-4" cols="30" rows="10"
                                  placeholder="Leave a Message" name="commentText"></textarea>
                    </div>
                    <div class="form-group mb-5">
                        <div class="row">
                            <%
                                if (username != null) {
                            %>
                            <div class="col-md-8" style="margin-top: 5px">
                                <input type="submit" class="btn btn-primary  px-4 py-3"
                                       value="Leave Message">
                            </div>
                            <%
                                }
                            %>
                            <div class="col-md-4" style="margin-top: 5px">
                                <p><a href="/comment"
                                      class="smoothscroll btn btn-primary px-4 py-3">Goto
                                    messages</a></p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-5 pl-md-5">
                <h3 class="mb-5">My Contact Details</h3>
                <ul class="site-contact-details">
                    <li>
                        <span class="text-uppercase">Email</span>
                        <strong>chennan@bjfu.edu.cn</strong>
                    </li>
                    <li>
                        <span class="text-uppercase">Phone</span>
                        <strong>+86 176 1060 2157</strong>
                    </li>
                    <li>
                        <span class="text-uppercase">Address</span>
                        <strong>Beijing, China</strong> <br>
                        <strong>35th Qinghuadonglu </strong><br>
                        <strong>Beijing Forestry University</strong>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>


<footer class="site-footer bg-light">
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-12 text-center">
                <p>
                    <a href="https://github.com/cnyy7" class="social-item"><span class="icon-github2"></span></a>
                    <a href="https://www.zhihu.com/people/chen-nan-55" class="social-item"><span
                            class="fab fa-zhihu"></span></a>
                    <a href="https://yayawonder.netlify.com/yaya.html" class="social-item"><span
                            class="iconfont icon-yueryingerbaby-yaziduckquac"></span></a>
                    <a href="https://mp.weixin.qq.com/s?__biz=MzU3NDc1ODkxOQ==&mid=2247483675&idx=1&sn=79384586d758b29aedcf6a275dfae5a5&chksm=fd2cc873ca5b4165ea18824e86b4b4c07bd8c2d6812e8c7a9f18130462f5d79acc0fb34996a3&xtrack=1&scene=0&subscene=131&clicktime=1547283295&ascene=7&devicetype=android-27&version=27000038&nettype=WIFI&abtest_cookie=BQABAAoACwASABMAFAAGACaXHgBXmR4Am5keAJ2ZHgClmR4At5keAAAA&lang=zh_CN&pass_ticket=C6r1Ne3gjNwqLwHfl%2F7Gly8vqamKcCMXat%2FTVlWTBqg%3D&wx_header=1"
                       class="social-item"><span class="fas fa-cat"></span></a>
                    <%--<a href="#" class="social-item"><span class="icon-linkedin2"></span></a>--%>
                    <%--<a href="#" class="social-item"><span class="icon-vimeo"></span></a>--%>
                </p>
            </div>
        </div>
        <div class="row">
            <p class="col-12 text-center">

                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script>
                - Chennan All rights reserved

            </p>
        </div>
    </div>
</footer>


<script src="/static/js/vendor/jquery.min.js"></script>
<script src="/static/js/vendor/popper.min.js"></script>
<script src="/static/js/vendor/bootstrap.min.js"></script>

<script src="/static/js/vendor/jquery.easing.1.3.js"></script>
<script src="/static/js/vendor/jquery.stellar.min.js"></script>
<script src="/static/js/vendor/jquery.waypoints.min.js"></script>

<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<script src="/static/js/custom.js"></script>


</body>
</html>