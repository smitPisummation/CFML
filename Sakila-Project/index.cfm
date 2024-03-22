<cfparam name="url.name" default = "Admin" />

<!DOCTYPE html>
<html>
  <head>
    <title>Film Set</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
      label{
          width : 100px;
      }
  </style>
  </head>
  
  <body class = "bg-success vw-100 vh-100 d-flex justify-content-center align-items-center">
    <main class = "bg-success-subtle h-50 w-50 rounded d-flex justify-content-center align-items-center flex-column gap-3">
      <form action = "login-action.cfm" method = "post" class = "d-flex justify-content-center align-items-center flex-column gap-3">
        <h2 class="mb-3" >Login here</h2>
          <div>
              <label class = "">Email :</label>
              <input type = "text" name = "email"  class="p-1" />
          </div>
          <div>
              <label class = "">Password :</label>
              <input type = "password" name = "pass"  class="p-1" />
          </div>
          <button type = "submit" class="bg-success p-2 px-5 border-0 mt-3" onclick = ""> Submit </button>
          </form>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>

</html>

  