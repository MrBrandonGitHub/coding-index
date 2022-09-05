trigger trgContact2 on Contact (after insert,after update,after delete,after undelete) {
  if(trigger.isAfter &&(trigger.isUndelete || trigger.isInsert || trigger.isDelete)) {
    if(trigger.isdelete){
      trgContactHandler.afterInsert(trigger.old);
    }else {
      trgContactHandler.afterInsert(trigger.new);
    }
    //trgContactHandler.afterInsert(trigger.isDelete ? trigger.old : trigger.new);
  }
  else if(trigger.isAfter && trigger.isUpdate){
     trgContactHandler.afterUpdate(trigger.new,trigger.oldMap);
  }
}