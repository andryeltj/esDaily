# esDaily
Texto diário atravéz do conky
<p align="center">
<img src="https://github.com/andryeltj/esDaily/blob/master/esDaily.png" width="350" />
</p>
São necessários os seguintes pacotes:
>libxml2-utils apache2 w3m fonts-open-sans

Crie uma pasta em `/var/www/html` com o nome `daily`.
> sudo mkdir /var/www/html/daily && sudo -R 777 /var/www/html/daily

Extraia a pasta daily para ` ~/.conky`.

Execute o `run`.

Teste em um terminal
>conky -c ~/.conky/daily/run

Altere a linguagem do texto no arquivo `~/.conky/daily/language`.
O padrão é a linguagem do seu dispositivo, mas pode ser alterado para que fique fixo em outra baseada na sigla usada pela Organzação para sua linguagem escolhida.

<p align="center">
<img src="https://github.com/andryeltj/esDaily/blob/master/lingua.png" width="350" />
</p>

Exemplo.:

>Português (Portugal) = `jw-tpo`
>Françês = `fr`
>Inglês = `en`
>Italiano = `it`

E etc.
