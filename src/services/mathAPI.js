const mathAPI = {
    async bhaskara(a, b, c) {
        const data = {
            a: a,
            b: b,
            c: c
        }
        const response = await fetch('http://localhost:8081/bhaskara', {
            method: "POST",
            body: JSON.stringify(data)
        });
        const roots = await response.json();
        return roots;
    }
}

export default mathAPI;