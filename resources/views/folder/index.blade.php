<!doctype html>

<html
  lang="en"
  class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="front/assets/"
  data-template="vertical-menu-template"
  data-style="light">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Dashboard - Analytics | Vuexy - Bootstrap Admin Template</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="front/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&ampdisplay=swap"
      rel="stylesheet" />

    <!-- Icons -->
    <link rel="stylesheet" href="front/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="front/assets/vendor/fonts/tabler-icons.css" />
    <link rel="stylesheet" href="front/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->

    <link rel="stylesheet" href="front/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="front/assets/vendor/css/rtl/theme-default.css" class="template-customizer-theme-css" />

    <link rel="stylesheet" href="front/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="front/assets/vendor/libs/node-waves/node-waves.css" />

    <link rel="stylesheet" href="front/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="front/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="front/assets/vendor/libs/apex-charts/apex-charts.css" />
    <link rel="stylesheet" href="front/assets/vendor/libs/swiper/swiper.css" />
    <link rel="stylesheet" href="front/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
    <link rel="stylesheet" href="front/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
    <link rel="stylesheet" href="front/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="front/assets/vendor/css/pages/cards-advance.css" />

    <!-- Helpers -->
    <script src="front/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->

    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="front/assets/vendor/js/template-customizer.js"></script>

    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="front/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        @include('folder.sidebar')
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          @include('folder.header')

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            @yield('content')
            <!-- / Content -->

            <!-- Footer -->
            @include('folder.footer')
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>

      <!-- Drag Target Area To SlideIn Menu On Small Screens -->
      <div class="drag-target"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->

    <script src="front/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="front/assets/vendor/libs/popper/popper.js"></script>
    <script src="front/assets/vendor/js/bootstrap.js"></script>
    <script src="front/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="front/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="front/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="front/assets/vendor/libs/i18n/i18n.js"></script>
    <script src="front/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="front/assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="front/assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="front/assets/vendor/libs/swiper/swiper.js"></script>
    <script src="front/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>

    <!-- Main JS -->
    <script src="front/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="front/assets/js/dashboards-analytics.js"></script>
  </body>
</html>
