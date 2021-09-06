const local_ip = '192.168.15.27' // machine local ip for using api

const mathAPI = {
    async bhaskara(a, b, c) {
        const data = {
            a: a,
            b: b,
            c: c
        }
        const response = await fetch(`http://${local_ip}:8081/bhaskara`, {
            method: "POST",
            body: JSON.stringify(data)
        });
        const roots = await response.json();
        return roots;
    }
}

export default mathAPI;