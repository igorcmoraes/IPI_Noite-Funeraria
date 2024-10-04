const {validatePassword, checkPassword} = require('./passw')

it('Testando se a senha possui 8 caracteres' ,() =>{

    expect(validatePassword("abc!abcd")).toBe(true)
})
it('Testando se a senha não possui 8 caracteres' ,() =>{

    expect(validatePassword("aa")).toBe(false)
})

it('Testando se a senha possui caracter especial' ,() =>{

    expect(validatePassword("aaa!@aaa")).toBe(true)
})
it('Testando se a senha não possui caracter especial' ,() =>{

    expect(validatePassword("aaaabbbb")).toBe(false)
})

it('Testando se a senha possui letra minuscula' ,() =>{

    expect(validatePassword("123aa12!")).toBe(true)
})
it('Testando se a senha não possui letra minuscula ' ,() =>{

    expect(validatePassword("AAAAAAAA")).toBe(false)
})


it('Testando se a senha é igual a confirmação de senha' ,() =>{

    expect(checkPassword("abc123","abc123")).toBe(true)
})
it('Testando se a senha não é igual a confirmação de senha' ,() =>{

    expect(checkPassword("abc123","abc321")).toBe(false)
})

