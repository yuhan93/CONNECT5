ClassicEditor 

    .create(document.querySelector('#contentarea')) 
    .then( editor => { 
        console.log(editor); 
    }) 

    .catch(error => { 
        console.error(error); 
    });
