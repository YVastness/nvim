" __  ____   __  ___ _   _ ___ _______     _____ __  __  
"|  \/  \ \ / / |_ _| \ | |_ _|_   _\ \   / /_ _|  \/  | 
"| |\/| |\ V /   | ||  \| || |  | |  \ \ / / | || |\/| | 
"| |  | | | |    | || |\  || |  | |_  \ V /  | || |  | | 
"|_|  |_| |_|   |___|_| \_|___| |_(_)  \_/  |___|_|  |_| 
                                                        
source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/plug-config.vim
for file in split(glob('~/.config/nvim/config/*.vim'),'\n')
		exe 'source' file
endfor
