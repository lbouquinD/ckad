
1] On verifie la version actuelle

[root@ppfxasautd1103 app-admin]# vault operator members
Host Name         API Address                              Cluster Address             Active Node    Version    Upgrade Version    Redundancy Zone    Last Echo
---------         -----------                              ---------------             -----------    -------    ---------------    ---------------    ---------
ppfxasautd1103    https://vault-test1.dev.ppf.aife:8200    https://10.51.82.12:8201    true           1.13.1     1.13.1             n/a                n/a
ppfxasvaud1103    https://vault-test2.dev.ppf.aife:8200    https://10.51.82.13:8201    false          1.13.1     1.13.1             n/a                2024-05-14T09:51:29+02:00
ppfxasautd1106    https://vault-test3.dev.ppf.aife:8200    https://10.51.82.18:8201    false          1.13.1     1.13.1             n/a                2024-05-14T09:51:29+02:00
[root@ppfxasautd1103 app-admin]#


2] On change la valeur dans le groups_var  vault de l'inventaaie sur l'environnement souhaité

3] On commit puis on lance le rôle ansible avec le bon tag
[app-ansible@ppfxasautd1101 ansible]$ ansible-playbook playbook/vault.yaml  -i inventories/test/ -b --ask-vault-password  --tags=upgrade --limit=vault2



4] Unseal  le noeud mis a jour
[root@ppfxasvaud1103 app-admin]# vault operator unseal
Unseal Key (will be hidden):
Key                Value
---                -----
Seal Type          shamir
Initialized        true
Sealed             true
Total Shares       5
Threshold          3
Unseal Progress    2/3
Unseal Nonce       e6ad386c-e400-c990-47af-1cbf5c1e60ac
Version            1.13.13+ent
Build Date         2024-01-29T18:05:30Z
Storage Type       raft
HA Enabled         true


5]  on verifie que la verison est  correct que le noeud est  bien rattaché au cluster
[root@ppfxasautd1103 app-admin]# vault operator members
Host Name         API Address                              Cluster Address             Active Node    Version    Upgrade Version    Redundancy Zone    Last Echo
---------         -----------                              ---------------             -----------    -------    ---------------    ---------------    ---------
ppfxasautd1103    https://vault-test1.dev.ppf.aife:8200    https://10.51.82.12:8201    true           1.13.1     1.13.1             n/a                n/a
ppfxasvaud1103    https://vault-test2.dev.ppf.aife:8200    https://10.51.82.13:8201    false          1.13.13    1.13.13            n/a                2024-05-14T10:24:40+02:00
ppfxasautd1106    https://vault-test3.dev.ppf.aife:8200    https://10.51.82.18:8201    false          1.13.1     1.13.1             n/a                2024-05-14T10:24:44+02:00
[root@ppfxasautd1103 app-admin]#



6]  On répète les  point 3,4  et  5 mais avec le noeud 3 

7] On change l'actif pour pouvoir mettre à jour le noeud 
[root@ppfxasautd1103 app-admin]# vault operator members
Host Name         API Address                              Cluster Address             Active Node    Version    Upgrade Version    Redundancy Zone    Last Echo
---------         -----------                              ---------------             -----------    -------    ---------------    ---------------    ---------
ppfxasautd1103    https://vault-test1.dev.ppf.aife:8200    https://10.51.82.12:8201    true           1.13.1     1.13.1             n/a                n/a
ppfxasvaud1103    https://vault-test2.dev.ppf.aife:8200    https://10.51.82.13:8201    false          1.13.13    1.13.13            n/a                2024-05-14T10:30:50+02:00
ppfxasautd1106    https://vault-test3.dev.ppf.aife:8200    https://10.51.82.18:8201    false          1.13.13    1.13.13            n/a                2024-05-14T10:30:49+02:00
[root@ppfxasautd1103 app-admin]# vault operator step-down
Success! Stepped down: https://127.0.0.1:8200
[root@ppfxasautd1103 app-admin]# vault operator members
Host Name         API Address                              Cluster Address             Active Node    Version    Upgrade Version    Redundancy Zone    Last Echo
---------         -----------                              ---------------             -----------    -------    ---------------    ---------------    ---------
ppfxasautd1103    https://vault-test1.dev.ppf.aife:8200    https://10.51.82.12:8201    false          1.13.1     1.13.1             n/a                2024-05-14T10:31:26+02:00
ppfxasvaud1103    https://vault-test2.dev.ppf.aife:8200    https://10.51.82.13:8201    true           1.13.13    1.13.13            n/a                n/a
ppfxasautd1106    https://vault-test3.dev.ppf.aife:8200    https://10.51.82.18:8201    false          1.13.13    1.13.13            n/a                2024-05-14T10:31:26+02:00
[root@ppfxasautd1103 app-admin]#


8] Verification de la bonne version version. 

[root@ppfxasautd1103 app-admin]# vault operator members
Host Name         API Address                              Cluster Address             Active Node    Version    Upgrade Version    Redundancy Zone    Last Echo
---------         -----------                              ---------------             -----------    -------    ---------------    ---------------    ---------
ppfxasautd1103    https://vault-test1.dev.ppf.aife:8200    https://10.51.82.12:8201    false          1.13.13    1.13.13            n/a                2024-05-14T10:55:33+02:00
ppfxasvaud1103    https://vault-test2.dev.ppf.aife:8200    https://10.51.82.13:8201    true           1.13.13    1.13.13            n/a                n/a
ppfxasautd1106    https://vault-test3.dev.ppf.aife:8200    https://10.51.82.18:8201    false          1.13.13    1.13.13            n/a                2024-05-14T10:55:31+02:00
[root@ppfxasautd1103 app-admin]