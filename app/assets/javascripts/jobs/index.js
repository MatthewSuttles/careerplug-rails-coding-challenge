/**
 * Created by matthew on 7/1/15.
 */
$(document).ready(function(){
    $('button').click(function(event){
        if ($(this).attr('class') == "add_comment") {
           var id = event.target.id
           var $id = $("#" + id)
           $id.hide()
            $('#'+ id +'_comment_form').show()
       }
    });

    $('button').click(function(event){
       if($(this).attr('class') == "submit_comment"){
            var job_id = $(this).data("id")
            var description = $('#' + job_id + '_comment_description').val()
           $.ajax({
               url: 'comments/ajax_add_comment',
               type: "POST",
               dataType:'HTML',
               data: {comment:{job_id: job_id, description: description}},
               success: function(response){
                   $("#job_" + job_id + "_comments").append(response);
                   $('#' + job_id + '_comment_description').val("")
                   $('#' + job_id).show()
                   $('#'+ job_id +'_comment_form').hide()
               }
           });
       }
    });
});