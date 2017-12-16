<?php
/**
 * Copyright (C) 2015 Digimedia Sp. z o.o. d/b/a Clearcode
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

namespace SevenTag\Plugin\SalesManagoCustomTemplateBundle\Template;

use SevenTag\Api\TagBundle\Template\TemplatingProvider;
use SevenTag\Component\Tag\Model\TagInterface;
use SevenTag\Plugin\SalesManagoCustomTemplateBundle\Form\SalesManagoFormType;
use Symfony\Component\Form\FormTypeInterface;

/**
 * Class SalesManagoProvider
 * @package SevenTag\Plugin\SalesManagoCustomTemplateBundle\Template
 */
class SalesManagoProvider extends TemplatingProvider
{
    const KEY = 'sales_manago';

    /**
     * {@inheritdoc}
     */
    public function getKey()
    {
        return self::KEY;
    }

    /**
     * @return FormTypeInterface
     */
    public function getFormType()
    {
        return SalesManagoFormType::class;
    }

    /**
     * {@inheritdoc}
     */
    public function prePersist(TagInterface $tag)
    {
        $tag->setCode($this->generateCode($tag));
        $tag->setDocumentWrite(false);

        return $tag;
    }

    /**
     * {@inheritdoc}
     */
    public function getTemplatePath()
    {
        return 'SevenTagPluginSalesManagoCustomTemplateBundle:Template:SalesManagoProvider.js.twig';
    }
}
