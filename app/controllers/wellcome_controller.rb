class WellcomeController < ApplicationController

  

  def default
    @studies = Study.where("active").order('`order` ASC')
    @gene_example_1 = {}
    @example = {}
    gene_set_id = false 
    gene_set_id = session[:gene_set_id] if session[:gene_set_id]
    gene_set = GeneSet.find_by(:selected => true) unless gene_set_id
    gene_set_id = gene_set.id if gene_set
    gene_set_id = 1 unless gene_set_id
    gene_set = GeneSet.find(gene_set_id)        

    @example = GenesHelper.get_example_genes(gene_set)
    session[:gene_set_id] = gene_set.id    
    respond_to do |format|
      format.html
    end
  end

  def cite
    
  end
  
  def search_gene
  end

   def variety_params
      params.require(:variety).permit(:gene)
   end
end
