<!DOCTYPE html>
<html lang="en">
<head>
  <title>E-Waste Management System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
 /* ~~~~~~~ INIT. BTN ~~~~~~~ */

.btn {
  position: relative;
  padding: 1.4rem 4.2rem;
  padding-right: 3.1rem;
  font-size: 1.4rem;
  color: var(--inv);
  letter-spacing: 1.1rem;
  text-transform: uppercase;
  transition: all 600ms cubic-bezier(0.77, 0, 0.175, 1);
  cursor: pointer;
  user-select: none;
}

.btn:before, .btn:after {
  content: '';
  position: absolute;
  transition: inherit;
  z-index: -1;
}

.btn:hover {
  color: var(--def);
  transition-delay: .6s;
}

.btn:hover:before {
  transition-delay: 0s;
}

.btn:hover:after {
  background: var(--inv);
  transition-delay: .4s;
}

/* From Top */

.from-top:before,
.from-top:after {
  left: 0;
  height: 0;
  width: 100%;
}

.from-top:before {
  bottom: 0;
  border: 1px solid var(--inv);
  border-top: 0;
  border-bottom: 0;
}

.from-top:after {
  top: 0;
  height: 0;
}

.from-top:hover:before,
.from-top:hover:after {
  height: 100%;
}

/* From Left */

.from-left:before,
.from-left:after {
  top: 0;
  width: 0;
  height: 100%;
}

.from-left:before {
  right: 0;
  border: 1px solid var(--inv);
  border-left: 0;
  border-right: 0;
}

.from-left:after {
  left: 0;
}

.from-left:hover:before,
.from-left:hover:after {
  width: 100%;
}

/* From Right */

.from-right:before,
.from-right:after {
  top: 0;
  width: 0;
  height: 100%;
}

.from-right:before {
  left: 0;
  border: 1px solid var(--inv);
  border-left: 0;
  border-right: 0;
}

.from-right:after {
  right: 0;
}

.from-right:hover:before,
.from-right:hover:after {
  width: 100%;
}

/* From Middle */

.from-middle:before {
  top: 0;
  left: 50%;
  height: 100%;
  width: 0;
  border: 1px solid var(--inv);
  border-left: 0;
  border-right: 0;
}

.from-middle:after {
  bottom: 0;
  left: 0;
  height: 0;
  width: 100%;
  background: var(--inv);
}

.from-middle:hover:before {
  left: 0;
  width: 100%;
}

.from-middle:hover:after {
  top: 0;
  height: 100%;
}

/* From Bottom */

.from-bottom:before,
.from-bottom:after {
  left: 0;
  height: 0;
  width: 100%;
}

.from-bottom:before {
  top: 0;
  border: 1px solid var(--inv);
  border-top: 0;
  border-bottom: 0;
}

.from-bottom:after {
  bottom: 0;
  height: 0;
}

.from-bottom:hover:before,
.from-bottom:hover:after {
  height: 100%;
}


/* ~~~~~~~~~~~~ GLOBAL SETTINGS ~~~~~~~~~~~~ */

*, *:before, *:after {
  box-sizing: border-box;
}

body {
  --def: #96B7C4;
  --inv: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 100vh;
  width: 100%;
  background-image: linear-gradient(-25deg, #616161 0%, #96B7C4 100%);
}

html {
  font-size: 12px;
  font-family: 'Playfair Display', serif;
}

div {margin-bottom: 3rem;}
div:last-child {margin-bottom: 0;}




<!preloader>


.preloader-1 {
  margin: 100px auto 0;
  width: 66px;
  height: 12px;
}



div {
  color: #fff;
  margin: 5px 0;
  text-transform: uppercase;
  text-align: center;
  font-family: 'Arial', sans-serif;
  font-size: 10px;
  letter-spacing: 2px;
}

.preloader-1 .line {
  width: 1px;
  height: 12px;
  background: #fff;
  margin: 0 1px;
  display: inline-block;
  animation: opacity-1 1000ms infinite ease-in-out;
}

.preloader-1 .line-1, .preloader-2 .line-1 { animation-delay: 800ms; }
.preloader-1 .line-2, .preloader-2 .line-2 { animation-delay: 600ms; }
.preloader-1 .line-3, .preloader-2 .line-3 { animation-delay: 400ms; }
.preloader-1 .line-4, .preloader-2 .line-4 { animation-delay: 200ms; }
.preloader-1 .line-6, .preloader-2 .line-6 { animation-delay: 200ms; }
.preloader-1 .line-7, .preloader-2 .line-7 { animation-delay: 400ms; }
.preloader-1 .line-8, .preloader-2 .line-8 { animation-delay: 600ms; }
.preloader-1 .line-9, .preloader-2 .line-9 { animation-delay: 800ms; }

@keyframes opacity-1 {
  0% {
    opacity: 1;
  }
  50% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}


}
</style>
</head>
<body>

<div class="preloader-1">
  <div><h1>E-waste Management System</h1></div>
  <span class="line line-1"></span>
  <span class="line line-2"></span>
  <span class="line line-3"></span>
  <span class="line line-4"></span>
  <span class="line line-5"></span>
  <span class="line line-6"></span>
  <span class="line line-7"></span>
  <span class="line line-8"></span>
  <span class="line line-9"></span>
</div>
       <a href = "/buyer" ><div class="btn from-top">Buy</div> </a>
        <a href = "/user" > <div class="btn from-top">Sell</div> </a>





<script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/aos.js"></script>
<script src="js/typed.js"></script>
            <script>
            var typed = new Typed('.typed-words', {
            strings: ["Seller?"," Buyer?"],
            typeSpeed: 80,
            backSpeed: 80,
            backDelay: 4000,
            startDelay: 1000,
            loop: true,
            showCursor: true
            });
            </script>

  <script src="js/main.js"></script>
</body>
</html>
