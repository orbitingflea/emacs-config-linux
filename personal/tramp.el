(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(setq tramp-auto-save-directory "~/.tmp/tramp/")
(setq tramp-chunksize 2000)
