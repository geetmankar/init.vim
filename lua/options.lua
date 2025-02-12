vim.api.nvim_create_user_command("Ssh01", "RemoteSSHFSConnect gmankar@euclid01:/home/gmankar/", {})
vim.api.nvim_create_user_command("Ssh02", "RemoteSSHFSConnect gmankar@euclid02:/home/gmankar/", {})
vim.api.nvim_create_user_command("Ssh03", "RemoteSSHFSConnect gmankar@euclid03:/home/gmankar/", {})

vim.api.nvim_create_user_command("Num01", "RemoteSSHFSConnect gmankar@euclid01:/home/gmankar/work/num_density", {})
vim.api.nvim_create_user_command("Num02", "RemoteSSHFSConnect gmankar@euclid02:/home/gmankar/work/num_density", {})
vim.api.nvim_create_user_command("Num03", "RemoteSSHFSConnect gmankar@euclid03:/home/gmankar/work/num_density", {})

vim.api.nvim_create_user_command("Simdet01", "RemoteSSHFSConnect gmankar@euclid01:/home/gmankar/work/sims_dets", {})
vim.api.nvim_create_user_command("Simdet02", "RemoteSSHFSConnect gmankar@euclid02:/home/gmankar/work/sims_dets", {})
vim.api.nvim_create_user_command("Simdet03", "RemoteSSHFSConnect gmankar@euclid03:/home/gmankar/work/sims_dets", {})
