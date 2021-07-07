const MathAPI = {
    async bhaskara(data) {
        const response = await fetch('http://localhost:8081/bhaskara', {
            method: "POST",
            body: JSON.stringify(data)
        });
        const roots = await response.json();
        return roots;
    }
}

export default MathAPI;