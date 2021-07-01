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
    return "$x1", "$x2"
end

function calculate(req::Request, coef)
    a = coef["a"]
    b = coef["b"]
    c = coef["c"]
    x1, x2 = bhaskara(a, b, c)
    return Dict("x1" => x1, "x2" => x2)
end

const ROUTER = Router()

const headers = [
    "Access-Control-Allow-Origin" => "*",
    "Access-Control-Allow-Headers" => "*",
    "Access-Control-Allow-Methods" => "*",
    "Content-Type" => "application/json"
]

@register(ROUTER, "POST", "/bhaskara", calculate)

serve(Sockets.localhost, 8081) do req::Request
    body = IOBuffer(payload(req))
    response_body = handle(ROUTER, req, JSON3.read(body))
    res = Response(200, JSON3.write(response_body))
    res.headers = headers
    return res
end