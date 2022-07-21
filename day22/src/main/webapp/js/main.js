/*--------------------------------------------------
# 변수 선언
--------------------------------------------------*/
let i = [];

/*--------------------------------------------------
# 함수 선언
--------------------------------------------------*/
function preset(){
  i = [];
  $('section').each(function(){
    i.push($(this).offset().top);
  });
  i.push($('section').last().offset().top + $('section').last().height());
  i[0] = 0;
}

/*--------------------------------------------------
# 스크롤 이벤트
--------------------------------------------------*/
$(window).on('resize', function(){
  preset();
});
preset();

$(window).on('scroll', function(){
  let scrolls = $(this).scrollTop() + $(window).height();
  $('section').each(function(ins){
    if(scrolls >= i[ins] + 200 && scrolls <= i[ins+1]){
      $('section').eq(ins).addClass('on').siblings().removeClass('on');
    }
  });
});

/*--------------------------------------------------
# 헤더 - 메뉴
--------------------------------------------------*/

$('#header .menu>li').on('mouseenter', function(){
  let index = $(this).index();
  $('#header .menu>li').removeClass('on').eq(index).addClass('on');
  $('#header .nav-bg').hide().eq(index).show();
  $('#header .sub-menu').hide().eq(index).css('display', 'flex');
});

$('#header .document-submit').on('mouseenter', function(){
  $('#header .menu>li').removeClass('on');
  $('#header .nav-bg').hide();
  $('#header .sub-menu').hide();
});

$('#header').on('mouseleave', function(){
  $('#header .menu>li').removeClass('on');
  $('#header .nav-bg').hide();
  $('#header .sub-menu').hide();
});

/*--------------------------------------------------
# 메인 - 프렌즈 체크카드, 내가 고르는 선택의 즐거움
--------------------------------------------------*/
let checkCard = new Swiper('#check-card .slide-vi', {
  loop: true,
  centeredSlides: true,
  slidesPerView: 3,
  effect: 'coverflow',
  coverflowEffect: {rotate: 0, scale: .88, depth: 37, stretch: 110, slideShadows: false},
  navigation: {
    nextEl: '.next',
    prevEl: '.prev',
  },
});