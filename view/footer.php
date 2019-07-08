<!--            <div class="row">-->
<!--                <div class="col-xs-12">-->
<!--                    <hr />-->
<!--                    <footer class="text-center well">-->
<!--                        <p>Ejemplo desarrollado por <a href="http://anexsoft.com">Anexsoft</a></p>-->
<!--                    </footer>                -->
<!--                </div>    -->
<!--            </div>-->
<!--        </div>-->
<!---->
<!--        <script src="assets/js/bootstrap.min.js"></script>-->
<!--        <script src="assets/js/jquery-ui/jquery-ui.min.js"></script>-->
<!--        <script src="assets/js/ini.js"></script>-->
<!--        <script src="assets/js/jquery.anexsoft-validator.js"></script>-->
<!--    </body>-->
<!--</html>-->

<hr>
<?php  if (isset($_SESSION['username'])){
//            ?><!-- -->
<!-- Footer -->
<footer class="page-footer font-small blue pt-4">

  


    <div class="footer-copyright text-center py-3 bg-warning">
        <h5>Siguenos <i class="fab fa-facebook-f"></i> <i class="fab fa-instagram"></i> <i class="fab fa-twitter"></i> <i class="fab fa-youtube"></i> <i class="fab fa-linkedin-in"></i> <i class="fab fa-flickr"></i></h5>
    </div>

    <!-- Copyright -->
    <div class="footer-copyright text-center py-0 bg-warning">© 2019 Copyright:
        <a href="./Home.php"> Juegos Panamericanos</a> <br>
        <img src="./assets/images/ondas.png" class="img-fluid" alt="Responsive image">
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
<?php 
}
 ?>

<!--<script type='text/javascript' src='./jquery/jquery-migrate-1.2.1.min.js'></script>-->
<!--<script type='text/javascript' src='./jquery/jquery.plugins.js'></script>-->
<!--<script type='text/javascript' src='./jquery/mediaelement-and-player.min.js'></script>-->

<script type='text/javascript' src='./assets/js/contador.js'></script>
<script src='https://www.google.com/recaptcha/api.js'></script>


</body>
</html>
