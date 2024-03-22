<nav class="navbar navbar-dark bg-dark vw-100 ">
  <div class="container-fluid">
    <cfoutput> <a class="navbar-brand" href="">Welcome #session.name#</a> </cfoutput>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Menu</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/dashbord.cfm">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="/actor">Actors</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="/address">Address</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="/category">Category</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-danger" href="logout.cfm">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav> 


