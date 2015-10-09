# Sistema de Controle de Projetos de Pesquisa (rails)

**Baixar o projeto, descompactar e fazer as alterações abaixo**

Considerando que o usuário seja chamado de deploy

```console
  wget https://github.com/ifrsfeliz/scp-rails/archive/master.zip
  sudo apt-get install unzip
  unzip master.zip
  rm master.zip
  sudo chown deploy:deploy scp-rails-master

  mkdir ~/app
  mv scp-rails-master ~/app/scp
```

#### Imagens Customizadas

Na pasta do projeto scp-rails-master, deverão ser trocadas imagens que referenciam os campus:

As imagens podem ser vistas aqui: https://github.com/ifrsfeliz/scp-rails/tree/master/app/assets/images

Na pasta: app/assets/images trocar as três imagens necessárias:

* **logo.png** - logo do campus (276x100px)
* **email-header.png** - cabeçalho do e-mail (600x129px)
* **mid-logo.png** - logo do departamento ou o que preferirem (157x100px)

#### Usuário Administrador

Alterar a linha abaixo do arquivo db/seeds.rb com o e-mail, senha e confirmação de senha que desejarem.

Este será o Administrador do Sistema

```ruby
u = User.new(:email => "sti@feliz.ifrs.edu.br", :password => '12345678', :password_confirmation => '12345678')
```

## Instalação no Ubuntu

Antes de qualquer coisa atualizar o sistema:

```console
sudo apt-get update
```

```console
sudo apt-get upgrade
```

Instalar alguns pacotes de dependências

```console
sudo apt-get install build-essential libmysqlclient-dev libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3 imagemagick apt-transport-https ca-certificates libgmp3-dev
```

Verificar a versão stable do ruby: https://www.ruby-lang.org/en/downloads/ e fazer o download via wget

Alterar esse link sempre que tiver nova versão (a versão 2.2.1 tava falhando no comando make, caso falhar pegar a versão stable anterior)

```console
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable
```

Colocar no final do arquivo .bash_profile no diretório home do usuário exemplo (/home/<nomedoseuusuario>/.bash_profile)
```console
  source /home/deploy/.rvm/scripts/rvm
```

Verificar a versão do ruby

```console
ruby -v
```

Adicionar as chaves para download da última versão do NGINX

```console
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
```

Editar o arquivo de source do apt-get

```console
sudo nano /etc/apt/sources.list
```

No final do arquivo colocar

```console
deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main
```

Atualizar os pacotes e instalar o NGINX e Passenger

```console
sudo apt-get update
```

```console
sudo apt-get install nginx-extras passenger
```


Verificar onde está instalado o ruby para colocar dentro do arquivo `nginx.conf` (nos próximos passos) através do comando:

```console
passenger-config --ruby-command
```

Copiar a localização referente ao `Command`, exemplo do output:

```console
passenger-config was invoked through the following Ruby interpreter:
Command: /home/deploy/.rvm/gems/ruby-2.2.3/wrappers/ruby
Version: ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-linux]
To use in Apache: PassengerRuby /home/deploy/.rvm/gems/ruby-2.2.3/wrappers/ruby
To use in Nginx : passenger_ruby /home/deploy/.rvm/gems/ruby-2.2.3/wrappers/ruby
To use with Standalone: /home/deploy/.rvm/gems/ruby-2.2.3/wrappers/ruby /usr/bin/passenger start
```

Editar o arquivo /etc/nginx/nginx.conf

```console
sudo nano /etc/nginx/nginx.conf
```

Nas linhas onde estiver o código abaixo, descomentar as linhas tirando o '#', no passenger_ruby colocar a localização copiada do `Command`

```nginx
passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
passenger_ruby /home/deploy/.rvm/gems/ruby-2.2.3/wrappers/ruby;
```

Editar o arquivo /etc/nginx/sites-enabled/default

```console
sudo nano /etc/nginx/sites-enabled/default
```

Comentar o bloco server existente e adicionar esse abaixo, trocando seuusuario pelo seu Usuário e colocando o IP do seu servidor no server_name:

```nginx
server {
  listen 80;

  root /home/seuusuario/app/scp/public;
  passenger_enabled on;
  passenger_app_env production;

  # Make site accessible from the IP
  server_name 192.168.103.208;

}
```

Feito isso, reiniciar o nginx

```console
sudo service nginx restart
```

Instalar o banco de dados a ser utilizado

```console
sudo apt-get install mysql-server
```

Colocar a senha para o root etc, entrar no prompt do mysql executando o comando abaixo e colocando a senha do mysql

```console
mysql -p -u root
```

Criar o banco de dados da aplicação

```sql
CREATE DATABASE  scp;
```

Para sair do console digite: `\q`

Entrar na pasta do projeto e executar os comandos para instalar as bibliotecas do projeto e compilar os assets:

```console
  cd ~/app/scp
  echo "gem: --no-ri --no-rdoc" > ~/.gemrc
  gem install bundler
  bundle install
```

Configurar o arquivo do banco de dados `config/database.yml` com o código de exemplo, alterando o usuario e senha:

```yaml
production:
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: mysql_production
  username: usuariodobanco
  password: senhadousuario
  pool: 5
  host: localhost
  port: 3306
```

```console
  nano config/database.yml
```

Configurar o arquivo de segurança da aplicação, para gerar cookies etc. **NÃO UTILIZAR O CÓDIGO ABAIXO POR SEGURANÇA, ADICIONAR/ALTERAR/REMOVER ALGUNS CARACTERES**.

```console
nano config/secrets.yml
```

Dados do arquivo secrets.yml

```yaml
production:
  secret_key_base: b38c6d5ef3c8048bea9a41ff4ea20676e505404e973446c3efc9d281fe65
  secret_token: b38c6d5ef3c8048bea9a41ff4ea20676e505404e973446c3efc9d281654asd9
```

Configurar os dados para Envio de E-mail e URL do site para compilação dos assets

```console
nano config/settings.yml
```

Código de exemplo a ser colocado e modificado: o email_report_managers serão as pessoas que receberão cópias das notificações enviadas para os pesquisadores

```yaml
production:
  server_url: http://dominio.com
  gmail_username: usuario@gmail.com
  gmail_password: "senha123**"
  email_report_managers:
    - pessoa1@domain.com
    - pessoa2@domain.com

```

Se tudo estiver certo o comando abaixo, irá criar as tabelas de usuário e funções e também popular o usuário administrador configurado no início.

```console
rake db:setup RAILS_ENV=production
```

**ISSO É MUITO IMPORTANTE:** o comando abaixo faz a compilação dos javascript, css e imagens. Então toda vez que uma imagem for trocada deve ser re-executado o comando abaixo, caso contrário não surtirá efeito.

```console
rake assets:precompile RAILS_ENV=production
```

A partir disso é para estar funcionando, caso houver dúvidas, não existe em nos comunicar.

Para auxílio sti@feliz.ifrs.edu.br
