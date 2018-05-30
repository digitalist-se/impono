<?php

namespace Impono\VueBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        $variables = [
            'client' => 'client'
        ];
        return $this->render('ImponoVueBundle:Default:index.html.twig', $variables);
    }
}
