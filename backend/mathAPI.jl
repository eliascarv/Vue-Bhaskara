using HTTP
using HTTP.Handlers
using HTTP.Messages
using Sockets
using JSON3

function bhaskara(a, b, c)
    Δ = b^2 - 4 * a * c

    Δ < 0 && (Δ = Complex(Δ))

    x₁ = (-b + √Δ) / 2a
    x₂ = (-b - √Δ) / 2a
    return x₁, x₂
end

function handle_bhaskara(req::Request)
    coef = JSON3.read(req.body)

    a = coef.a
    b = coef.b
    c = coef.c
    x₁, x₂ = bhaskara(a, b, c)

    res_body = Dict("x1" => "$x₁", "x2" => "$x₂")
    res_headers = [
        "Access-Control-Allow-Origin" => "*",
        "Access-Control-Allow-Headers" => "*",
        "Access-Control-Allow-Methods" => "*",
        "Content-Type" => "application/json"
    ]

    return Response(200, res_headers, body = JSON3.write(res_body))
end

# Precompile
while true
    p1 = Dict("a" => 1, "b" => 3, "c" => -4)
    p2 = Dict("a" => 1, "b" => 2, "c" => 4)
    req1 = Request("POST", "", [], JSON3.write(p1))
    req2 = Request("POST", "", [], JSON3.write(p2))
    handle_bhaskara(req1)
    handle_bhaskara(req2)
    break
end

# Creating routes and starting the API
const ROUTER = Router()

@register(ROUTER, "POST", "/bhaskara", handle_bhaskara)

# Get local machine ip
const IP = getipaddr()

println("""\n
  API running at:
  http://$IP:8081/ 

  Route           Method
  =================================
  /bhaskara       POST
""")

serve(ROUTER, IP, 8081)
