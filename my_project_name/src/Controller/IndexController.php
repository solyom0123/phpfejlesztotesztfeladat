<?php


namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Security;

class IndexController extends AbstractController
{
    public function __construct(UrlGeneratorInterface $urlGenerator,Security $security)
    {
        $this->security = $security;
        $this->urlGenerator = $urlGenerator;
    }

    /**
     * @Route("/")
     *
     */
    public function load_main(): Response
    {
        $user = $this->security->getUser();
        if($user) {
            return new RedirectResponse($this->urlGenerator->generate('app_main'));
        }else{
            return new RedirectResponse($this->urlGenerator->generate('app_login'));
        }
    }
}