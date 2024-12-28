
<footer class="footer">
    <div class="container">
        
        <div class="row">
            <div class="col-lg-12">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
                    <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script></p>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </div>
    </div>
</footer>



<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form action="tim-kiem" method="get" class="search-model-form">
            <input type="search" name="query" id="search-input" placeholder="TÌM KIẾM.....">
        </form>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#toastr-success-top-right").on("click", function () {
            toastr.success("1 sản phẩm đã thêm vào giỏ", "Thành công", {
                closeButton: true,
                debug: false,
                newestOnTop: false,
                progressBar: true,
                positionClass: "toast-top-right",
                preventDuplicates: false,
                onclick: null,
                showDuration: "300",
                hideDuration: "1000",
                timeOut: "5000",
                extendedTimeOut: "1000",
                showEasing: "swing",
                hideEasing: "linear",
                showMethod: "fadeIn",
                hideMethod: "fadeOut"
            });
        });
    });
</script>

<!-- Js Plugins -->
<script src="public/js/jquery-3.3.1.min.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/jquery.magnific-popup.min.js"></script>
<script src="public/js/jquery-ui.min.js"></script>
<script src="public/js/mixitup.min.js"></script>
<script src="public/js/jquery.countdown.min.js"></script>
<script src="public/js/jquery.slicknav.js"></script>
<script src="public/js/owl.carousel.min.js"></script>
<script src="public/js/jquery.nicescroll.min.js"></script>
<script src="public/js/main.js"></script>

<!-- dialogflow -->
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
    intent="WELCOME"
    chat-title="Chat"
    agent-id="a111a74a-8334-4098-9636-0f1433d6fc97"
    language-code="vi"
></df-messenger>


</body>

</html>