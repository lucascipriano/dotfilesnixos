{
    description = "My personal dotfiles";

    outputs = { ... }@inputs:{
        templates = import ./templates;
    };
}