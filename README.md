<h1> IPI_Noite-Funeraria</h1>
<h2>Correções necessárias:</h2>
<ul>
  <ul>
    <li>Em cor_caixao e cor_forro, faça com que os atributos sejam enum, deixando assim já pré-configurado as cores que serão disponibilizadas.</li>
    <li>O tamanho de caixões não é definido como roupas (P, M...), e sim por medida de comprimento e largura. Portanto, faça com que a tabela caixao tenha ao invés do atributo "tamanho" dois atributos "altura" e "largura". Além disso, existe um tamanho padrão de caixões, procure essa informação e coloque esses valores como default. Isso precisa ser alterado no código e no DER./li>
  </ul>
  <ul>
    <li>No site, na página "detalhes" transforme cor do caixão em um select, com as cores definidas no enum do banco de dados. Lembre-se de configurar o label corretamente.
Na mesma página, troque a entrada radio do tamanho do caixão para entradas de altura e largura</li>
  </ul>
</ul>
