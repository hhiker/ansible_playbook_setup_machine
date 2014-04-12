project_root=~/mine/code/petuum

# Compile tools.
cd $project_root/apps/tools
make

# Run lda data processor.
mkdir $project_root/datasets/processed
cd $project_root
sh $project_root/scripts/run_lda_data_processor.sh  \
    $project_root/datasets/lda_data/20news.dat      \
    $project_root/datasets/processed/20news 2

# Compile lda.
cd $project_root/apps/lda_word_sampler
make
