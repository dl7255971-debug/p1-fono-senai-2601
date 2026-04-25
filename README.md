# Landing Page - Fonoaudiologia Moderna

![Preview do Projeto](assets/hero_bg.png)

Uma Landing Page moderna, responsiva e acolhedora desenvolvida para uma clínica de fonoaudiologia (Dra. Aline Silva). O objetivo do projeto é transmitir profissionalismo, confiança e facilitar o contato para agendamento de consultas.

## 🚀 Tecnologias Utilizadas

Este projeto foi construído focando em performance e simplicidade, utilizando as seguintes tecnologias:

*   **HTML5** (Semântico e acessível)
*   **CSS3** (Variáveis, Flexbox, CSS Grid)
*   **Phosphor Icons** (Ícones modernos via CDN)
*   **PowerShell** (Script de servidor local para desenvolvimento)

## 🎯 Funcionalidades e Seções

*   **Header / Navegação:** Menu fixo com efeito glassmorphism e navegação suave (smooth scroll).
*   **Hero Section:** Chamada principal de impacto com botões de ação (Call to Action).
*   **Sobre Mim:** Biografia profissional da especialista, com foco na humanização do atendimento.
*   **Especialidades:** Grid de cards detalhando os serviços prestados (Linguagem Infantil, Saúde Vocal, etc).
*   **Contato:** Formulário de agendamento (simulado) e informações diretas de contato (WhatsApp, E-mail, Localização).
*   **Rodapé:** Links para redes sociais e copyright.

## 💻 Como rodar o projeto localmente

Como o projeto utiliza rotas estáticas simples, você pode abri-lo diretamente no navegador, mas para a melhor experiência (evitando problemas com CORS e caminhos absolutos), foi disponibilizado um script de servidor local.

1.  Clone o repositório:
    ```bash
    git clone https://github.com/dl7255971-debug/p1-fono-senai-2601.git
    ```
2.  Acesse a pasta do projeto:
    ```bash
    cd "01 landing page" # ou o nome da pasta local
    ```
3.  Inicie o servidor local (apenas Windows/PowerShell):
    ```powershell
    .\server.ps1
    ```
4.  Abra o navegador no endereço: `http://localhost:3000/`

## 🛡️ Segurança e Boas Práticas

*   **Sem dependências pesadas:** Código limpo e de fácil manutenção sem a necessidade de `npm install` complexos.
*   **`.gitignore` configurado:** Ignora arquivos de sistema, logs e ambientes virtuais.
*   **Sem chaves expostas:** Nenhuma credencial hardcoded no código.

---
Desenvolvido com dedicação para apresentar a melhor experiência do usuário (UX) focada em conversão de pacientes.
