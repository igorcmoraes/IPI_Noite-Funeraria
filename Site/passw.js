function validatePassword(senha) {
    // Expressões regulares para verificar os critérios
    const temLetraMinuscula = /[a-z]/;
    const temCaractereEspecial = /[!@#$%^&*(),.?":{}|<>]/;
    
    // Verifica se a senha tem pelo menos 8 caracteres, uma letra minúscula e um caractere especial
    if (senha.length >= 8 && temLetraMinuscula.test(senha) && temCaractereEspecial.test(senha)) {
        return true;
    } else {
        return false;
    }
    
}
function checkPassword(password,confirmPassword) {
    // const password = document.getElementById("password").value;
    // const confirmPassword = document.getElementById("confirmPassword").value;
    // const passwordValid = validatePassword();

    if (password !== confirmPassword) {
        // document.getElementById("confirmMessage").innerText = "As senhas não coincidem.";
        return false
    } else {
        // document.getElementById("confirmMessage").innerText = "";
        return true;

    }


}

// function checkAge(idade) {
//     const birthDate = new Date(idade);
//     const today = new Date();
//     const age = today.getFullYear() - birthDate.getFullYear();
//     const monthDiff = today.getMonth() - birthDate.getMonth();
    
//     if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
//         age-1;
//     }

//     if (age < 18) {
//         // document.getElementById("ageMessage").innerText = "Você deve ter pelo menos 18 anos.";
//         return false;
//     } else {
//         // document.getElementById("ageMessage").innerText = "";
//         return true;

//     }
   

// }

// function updateCities() {
//     const state = document.getElementById("state").value;
//     const cities = {
//         "SP": ["São Paulo", "Campinas", "Santos"],
//         "RJ": ["Rio de Janeiro", "Niterói", "Petrópolis"],
//         "MG": ["Belo Horizonte", "Uberlândia", "Ouro Preto"],
//         "ES": ["Vitória", "Vila Velha", "Serra"]
//     };
//     const citySelect = document.getElementById("city");
//     citySelect.innerHTML = "<option value=''>Selecione uma cidade</option>";
//     if (state) {
//         cities[state].forEach(city => {
//             const option = document.createElement("option");
//             option.value = city;
//             option.text = city;
//             citySelect.add(option);
//         });
//         citySelect.disabled = false;
//     } else {
//         citySelect.disabled = true;
//     }
// }

// function validateForm(password,confirmPassword,idade,stateSelected,citySelected) {
//     const passwordValid = checkPassword(password,confirmPassword);
//     const ageValid = checkAge(idade);
//     // const stateSelected = document.getElementById("state").value !== "";
//     // const citySelected = document.getElementById("city").value !== "";

//     if (passwordValid && ageValid && (stateSelected !="" || stateSelected != undefined)  && (citySelected !="" || citySelected != undefined) ) {
//         // window.alert("Formulário enviado com sucesso!")
//         return true;
//     } else {
//         // document.getElementById("formMessage").innerText = "Por favor, preencha todos os campos corretamente.";
//         return false;
//     }

// }

// undefined quando não é digitado nada
// document.getElementById("password").addEventListener("input", validatePassword);

module.exports = {validatePassword, checkPassword}

