using HTTP
using HTTP.Handlers
using HTTP.Messages
using Sockets
using JSON3

function bhaskara(a, b, c)
    Δ = b^2 - 4 * a * c

    Δ < 0 && (Δ = Complex(Δ))

    x1 = (-b + √Δ) / 2a
    x2 = (-b - √Δ) / 2a
    return x1, x2
end

function calculate(req::Request, coef)
    a = coef["a"]
    b = coef["b"]
    c = coef["c"]
    x1, x2 = bhaskara(a, b, c)
    return Dict("x1" => "$x1", "x2" => "$x2")
end

const ROUTER = Router()

@register(ROUTER, "POST", "/bhaskara", calculate)

serve(Sockets.localhost, 8081) do req::Request
    req_body = IOBuffer(payload(req))
    res_body = handle(ROUTER, req, JSON3.read(req_body))
    res_headers = [
        "Access-Control-Allow-Origin" => "*",
        "Access-Control-Allow-Headers" => "*",
        "Access-Control-Allow-Methods" => "*",
        "Content-Type" => "application/json"
    ]
    return Response(200, res_headers, body = JSON3.write(res_body))
end