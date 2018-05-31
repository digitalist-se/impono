<?php

namespace Impono\VueBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $client = $em->getRepository('SevenTagSecurityBundle:Client')
            ->findOneBy(['id' => 1]);

        $session = $this->get('session');
        $oauth2_secret = $session->get('oauth2_secret');
        $variables = [
            'oauth2_secret' => $oauth2_secret,
            'current_user'=> get_current_user(),
            'session' => $session,
            'client' => $client,
        ];
        return $this->render('ImponoVueBundle:Default:index.html.twig', $variables);
    }
}
