package PayloadModuleFunctional {
    doc /* Chaîne fonctionnelle image de la charge utile (ActionFlow :
         succession = flot de contrôle, créable au mode lien T). */
    action def AcquireFrame;
    action def CompressFrame;
    action acquire : AcquireFrame;
    action compress : CompressFrame;
    first acquire then compress;
}
